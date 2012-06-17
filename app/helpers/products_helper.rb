#encoding: utf-8
module ProductsHelper

  def product_sizes(product)
    wear = ProductSize.collection("wear")
    shoes = ProductSize.collection("shoes")

    output = ""

    output += "<label><b>Одежда</b></label><div class='clear'></div>"
    wear.each do |size|
      output += "<label>#{size.name}</label>" + check_box_tag("size_to_product-#{product.id}-#{size.code}")
    end

    output += "<div class='clear'></div><label><b>Обувь</b></label><div class='clear'></div>"
    shoes.each do |size|
      output += "<label>#{size.name}</label>" + check_box_tag("size_to_product-#{product.id}-#{size.code}")
    end

    raw output
  end
end
