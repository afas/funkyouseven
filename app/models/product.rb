require "google_spreadsheet"
class Product < ActiveRecord::Base

  self.per_page = 12

  attr_accessible :title,
                  :brand_id,
                  :shop_section_id,
                  :section_category_id,
                  :look_id, #!!!
                  :career_id,
                  :sex_id,
                  :welcome_position_id, #!!!
                  :color,
                  :composition,
                  :description,
                  :price,
                  :season,
                  :import_comment

  belongs_to :brand
  belongs_to :shop_section
  belongs_to :section_category

  scope :shop_new_sidebar, order("created_at DESC").limit(2)

  def career
    Career.by_code(career_id)
  end

  def sex
    Sex.by_code(sex_id)
  end

  def self.import()

    if Product.all.size > 0
      last_post = Product.all.last.id
    end

    import_session = GoogleSpreadsheet.login("anton@black-sheep.ru", "rfhnjirf")
    worksheets = import_session.spreadsheet_by_key("0AicZb6Y8rwZzdDdDbjhlUmdUWUtyY1dMbmhCeVZiM0E").worksheets

    worksheets.each do |worksheet|
      shop_section_id = ShopSection.find_by_name(worksheet.title.to_s.capitalize).id
      worksheet.rows.each do |row|
        title = row[0].to_s.capitalize
        brand_id = Brand.find_or_create_by_name(row[1].to_s.capitalize).id

        import_comment = ""
        import_comment += row[2].to_s.capitalize + " /"
        color = row[3].to_s.capitalize
        composition = row[4].to_s.capitalize
        composition += ", " + row[5].to_s.capitalize unless row[5].empty?
        season = row[6].to_s.downcase unless row[6].empty?
        sex_id = Sex.by_short_name(row[7].to_s.downcase) unless row[7].empty?
        price = row[8].to_f
        import_comment += row[9].to_s.capitalize + " /"
        import_comment += row[10].to_s.capitalize + " /"

        Product.create(:title => title, :brand_id => brand_id, :color => color, :composition => composition, :import_comment => import_comment, :season => season, :sex_id => sex_id, :price => price)
      end
    end

#    t.string   "title"
#    t.float    "price"
#    t.text     "description"
#    t.string   "color"
#    t.string   "composition"
#    t.integer  "brand_id"
#    t.integer  "sex_id"
#    t.integer  "career_id"
#    t.integer  "shop_section_id"
#    t.integer  "section_category_id"
#    t.integer  "look_id"
#    t.string   "season"
#    t.integer  "welcome_position_id"
#    t.string   "import_comment"

  end

end
