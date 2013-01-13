#encoding: utf-8
require "google_spreadsheet"
class Product < ActiveRecord::Base

  self.per_page = 6

  attr_accessible :title,
                  :brand_id,
                  :shop_section_id,
                  :section_category_id,
                  :archive,
                  :look_id, #!!!
                  :career_id,
                  :sex_id,
                  :welcome_position_id, #!!!
                  :title_color,
                  :color,
                  :composition,
                  :description,
                  :price,
                  :season,
                  :preview_id,
                  :look,
                  :discount

  attr_writer :preview_id
  attr_reader :preview_id

  belongs_to :brand
  belongs_to :shop_section
  belongs_to :section_category

  has_many :product_images
  has_many :size_to_products

  has_many :product_to_looks
  has_many :looks, :through => :product_to_looks

  scope :with_images, joins(:product_images).group("product_images.product_id").where("product_images.id != 0")

  scope :not_archive_or_positive_count, includes(:size_to_products).where("products.archive = ? OR size_to_products.product_count > 0 AND products.archive = ?", false, true)
  scope :valid_products, with_images.not_archive_or_positive_count.where("products.price NOT NULL").order("products.updated_at DESC")

  scope :not_publish, order("products.updated_at DESC").limit(8)
  #scope :not_publish, includes(:size_to_products).where("products.price IS NULL OR products.shop_section_id IS NULL OR products.section_category_id IS NULL OR size_to_products.product_count IS NULL").order("created_at DESC")
  scope :shop_side_bar, valid_products.order("products.created_at DESC").limit(2)

  scope :all_looks, where("look = ?", true).order("products.updated_at DESC").limit(21)
  scope :more_looks, lambda { |current_id| where("look = ? AND id <> ?", true, current_id).order("products.updated_at DESC").limit(21) }

  after_create :update_attachements

  def initialize(*args)
    super
    self.preview_id = rand(99999999)+99999999 if self.preview_id.nil? && self.new_record?
  end

  def into_look(look_id)
     ProductToLook.find_all_by_product_id_and_look_id(self.id, look_id).size > 0
  end

  def has_product(product_id)
     ProductToLook.find_all_by_product_id_and_look_id(product_id, self.id).size > 0
  end

  def looks
    Product.joins(:product_to_looks).where("product_to_looks.product_id = ?", self.id)
  end

  def products
    Product.joins(:product_to_looks).where("product_to_looks.look_id = ?", self.id)
  end

  def available_sizes
    available_sizes = []
    self.size_to_products.each do |size_to_product|
      available_sizes << ProductSize.get_product_size_by_code(size_to_product.size_id) if (size_to_product.product_count > 0 && size_to_product.size_id != 55)
    end
    available_sizes << ProductSize.collection("order").first

    available_sizes
  end

  def reprocess_price
    self.price = 0
    self.products.each do |product|
      self.price += product.price
    end

    self.price *= (100 - self.discount).to_f / 100
    self.save
  end

  def self.all_sizes(product_id)
    all_sizes = []
    size_to_products = SizeToProduct.find_all_by_product_id(product_id)
    unless size_to_products.empty?
      sizes_by_type = ProductSize.collection_by_type_size_id(size_to_products.first.size_id)
      sizes_by_type.each do |size|
        includet_size = size
        size_to_products.each do |excludet_size|
          includet_size = nil if size.code == excludet_size.size_id
        end
        all_sizes << includet_size unless includet_size.nil?
      end
      all_sizes += ProductSize.collection("order")
    else
      all_sizes += ProductSize.collection("all")
    end
    all_sizes
  end

  def count_by_size_id(size_id)
    size_to_product = SizeToProduct.find_by_product_id_and_size_id(self.id, size_id)

    unless size_to_product.nil?
      return size_to_product.product_count
    else
      return 0
    end
  end

  def get_cover
    cover_images = ProductImage.find_all_by_product_id_and_cover(self.id, true)

    unless cover_images.empty?
      cover_images[rand(cover_images.size())]
    else
      ProductImage.find_by_product_id(self.id) || ProductImage.new
    end
  end

  def get_preview
    preview_images = ProductImage.find_all_by_product_id_and_preview(self.id, true)

    unless preview_images.empty?
      preview_images[rand(preview_images.size())]
    else
      ProductImage.find_by_product_id(self.id) || ProductImage.new
    end
  end

  def get_id
    self.id || self.preview_id
  end

  def career
    Career.by_code(career_id)
  end

  def sex
    Sex.by_code(sex_id)
  end

  def self.import()
    current_shop_section = nil

    import_session = GoogleSpreadsheet.login("anton@black-sheep.ru", "blacksheepforever")
    worksheets = import_session.spreadsheet_by_key("0AicZb6Y8rwZzdDdDbjhlUmdUWUtyY1dMbmhCeVZiM0E").worksheets

    worksheets.each_with_index do |worksheet, worksheet_number|
      current_shop_section = ShopSection.find_by_name(worksheet.title.mb_chars.capitalize.to_s)
      unless current_shop_section.nil?
        shop_section_id = current_shop_section.id
        last_product_number = current_shop_section.last_product_number
      end

      worksheet.rows.each_with_index do |row, row_number|
        if row_number > last_product_number
          description = ""
          title = row[0].mb_chars.capitalize.to_s unless row[0].empty?
          description += "#{row[1].mb_chars.capitalize.to_s}. " unless row[1].empty?
          section_category_id = SectionCategory.find_or_create_by_name_and_shop_section_id(row[2].to_s, shop_section_id).id unless row[2].empty?
          brand_id = Brand.find_or_create_by_name(row[3].to_s).id unless row[3].empty?
          career_id = Career.by_name(row[4].mb_chars.capitalize.to_s) unless row[4].empty?
          sex_id = Sex.by_short_name(row[5].mb_chars.downcase.to_s) unless row[5].empty?
          color = row[6].mb_chars.capitalize.to_s unless row[6].empty?
          description += "Текстура #{row[9].mb_chars.downcase.to_s}. " unless row[9].empty?
          description += "Дизайнер #{row[7].mb_chars.titleize.to_s}. " unless row[7].empty?
          description += "Модель #{row[12].mb_chars.titleize.to_s}. " unless row[12].empty?
          composition = row[8].mb_chars.capitalize.to_s unless row[8].empty?
          season = row[10].mb_chars.downcase.to_s unless row[10].empty?
          price = row[11].to_f unless row[11].empty?
          welcome_position_id = rand(4) - 1 + shop_section_id

          product = Product.create(:title => title,
                                   :description => description,
                                   :shop_section_id => shop_section_id,
                                   :section_category_id => section_category_id,
                                   :brand_id => brand_id,
                                   :career_id => career_id,
                                   :color => color,
                                   :composition => composition,
                                   :season => season,
                                   :sex_id => sex_id,
                                   :welcome_position_id => welcome_position_id,
                                   :price => price)


          unless product.nil?
            current_shop_section.last_product_number = row_number
            current_shop_section.save
          end
        end
      end if worksheet_number < 3 && !current_shop_section.nil?
    end
  end

  private

  def update_attachements
    unless self.preview_id.nil?
      images = ProductImage.find_all_by_product_id(self.preview_id)
      images.each do |image|
        image.product_id = self.id
        image.save
      end

      size_to_products = SizeToProduct.find_all_by_product_id(self.preview_id)
      size_to_products.each do |size_to_product|
        size_to_product.product_id = self.id
        size_to_product.save
      end
    end
  end

end
