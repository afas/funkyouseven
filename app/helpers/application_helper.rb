#encoding: utf-8
module ApplicationHelper

  def meta_tags(unit)
    case unit.class.to_s
      when "Product"
        title = product_title(unit) + " — #{t('site_name')} — Shop"
        description = unit.description.blank? ? t('site_description') : "#{unit.description}"
        keywords = product_title(unit) + ", #{t('site_keywords')}"
      when "Post"
        title = "#{unit.title} — #{t('site_name')} — Magazine"
        description = unit.description.blank? ? t('site_description') : "#{unit.description}"
        keywords = "#{unit.title}, #{t('site_keywords')}"
      when "Brand"
        title = "#{unit.name} — #{t('site_name')} — Shop"
        description = unit.description.blank? ? t('site_description') : "#{unit.description}"
        keywords = "#{unit.name}, #{t('site_keywords')}"
      else
        title = t('site_name')
        description = t('site_description')
        keywords = "#{unit.title}, #{t('site_keywords')}"
    end

    content_for(:title) { title }
    content_for(:keywords) { keywords }
    content_for(:description) { description }
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

    if classname == "product"
      links += "<li>" + link_to("Импорт", shop_import_catalog_path, :title => "Запустить импорт") + "</li>"
      links += "<li>" + link_to("Не опубликованные", shop_not_publish_path, :title => "Не допущенные к публикации") + "</li>"
      links += "<li>" + link_to("Архив", shop_archive_path, :title => "Архив") + "</li>"
    end

    links += "</ul></li>"

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
        output += admin_partial(@cover_magazine, "cover_magazine")
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
