#encoding: utf-8
module ProductsHelper

  def format_price(price)
    number_to_currency(price, :precision => 0, :unit => "p.")
  end

  def product_title(product, container = false)
    unless container
      title = product.title.gsub("{", "")
      title = title.gsub("}", "")
    else
      title = product.title.gsub("{", "<#{container} style='color: #{product.title_color} !important;'>")
      title = title.gsub("}", "</#{container}>")
    end
    title
  end

  def product_sizes(product)
    wear = ProductSize.collection("wear")
    shoes = ProductSize.collection("shoes")

    output = ""

    output += "<label><b>Одежда</b></label><div class='clear'></div>"

    wear.each do |size|
      output += "<div class='size_unit'><label>#{size.name}</label>" + text_field_tag("size_to_product_count-#{product.id}-#{size.code}", product.count_by_size_id(size.code), :onkeyup => "onKeyUpSizeCount(event, #{product.id}, #{size.code});") + "</div>"
    end

    output += "<div class='clear'></div><label><b>Обувь</b></label><div class='clear'></div>"
    shoes.each do |size|
      output += "<div class='size_unit'><label>#{size.name}</label>" + text_field_tag("size_to_product_count-#{product.id}-#{size.code}", product.count_by_size_id(size.code), :onkeyup => "onKeyUpSizeCount(event, #{product.id}, #{size.code});") + "</div>"
    end

    raw output
  end
end

