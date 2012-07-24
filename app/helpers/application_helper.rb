#encoding: utf-8
module ApplicationHelper
  def meta_tags(unit)
    content_for(:title) { unit.seo_title.blank? ? "#{unit.title} :: #{t('site_name')}" : unit.seo_title }
    content_for(:description) { unit.seo_description.blank? ? "#{unit.title} ~ #{t('site_name')}" : unit.seo_description }
    content_for(:keywords) { unit.seo_keywords.blank? ? "#{unit.title} ~ #{t('site_name')}" : unit.seo_keywords }
  end

  def admin_partial(object, classname)
    links = "<li class='title'>" + t("activerecord.attributes.admin_menu.#{classname}") + "<ul>"

    unless object.nil? || object.new_record?
      edit_path = send("edit_#{object.class.name.underscore}_path", object)

      begin
        confirm_text = "Удалить \"#{object.title}\"?"
      rescue NoMethodError
        confirm_text = 'Точно?'
      end

      links += "<li>" + link_to('Изменить', edit_path, :title => "Изменить") + "</li>" if can?(:update, object)
      links += "<li>" + link_to('Удалить', object, :confirm => confirm_text, :method => :delete, :title => "Удалить") + "</li>" if can?(:destroy, object)
    end

    create_path = send("new_#{classname}_path")
    links += "<li>" + link_to('Создать', create_path, :title => "Создать") + "</li>" if can?(:create, object)

    links += "<li>" + link_to("Импорт", shop_import_catalog_path, :title => "Запустить импорт") + "</li>" if classname == "product"

    links +=  "</ul></li>"

    raw links
  end

  def admin_panel
    output = ""
    case controller_name
      when "products", "brands"
        output += admin_partial(@shop_section, "shop_section")
        output += admin_partial(@section_category, "section_category")
        output += admin_partial(@brand, "brand")
        output += admin_partial(@product, "product")
        #output += admin_partial(@look, "look")
      #when "brands"
      #  output += admin_partial(@product, "product")
      when "posts"
        output += admin_partial(@post, "post")
      when "statics"
        output += admin_partial(@static, "static")
      when "welcomes"
        output += "<li class='title'>#{t("activerecord.attributes.admin_menu.welcome")}<ul><li>" + link_to("Изменить", edit_welcome_path(@welcome)) + "</li></ul></li>" if can?(:edit, Welcome) && !@welcome.nil?
#      else
#        puts "oO"
    end

    raw output unless output.empty?
  end

end
