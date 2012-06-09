require "google_spreadsheet"
class Product < ActiveRecord::Base
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
      shop_section_id = ShopSection.find_by_name(worksheet.title.to_s).id
      worksheet.rows.each do |row|
        title = row[0].to_s
        brand_id = Brand.find_or_create_by_name(row[1].to_s.upcase).id
        title = row[2].to_s
        title = row[3].to_s
        title = row[4].to_s
        title = row[5].to_s


#    puts shop_section_id

#        import_comment
#        row[1]
#        user = User.find_or_create_by_screen_name("atog")
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
#    t.datetime "created_at",          :null => false
#    t.datetime "updated_at",          :null => false


  end

end
