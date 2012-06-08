module ApplicationHelper
  def meta_tags(unit)
    content_for(:title) { unit.seo_title.blank? ? "#{unit.title} :: #{t('site_name')}" : unit.seo_title }
    content_for(:description) { unit.seo_description.blank? ? "#{unit.title} ~ #{t('site_name')}" : unit.seo_description }
    content_for(:keywords) { unit.seo_keywords.blank? ? "#{unit.title} ~ #{t('site_name')}" : unit.seo_keywords }
  end


  def admin_panel(target)
    edit_path = send("edit_#{target.class.to_s.downcase}_path", target)

    output = nil
    output = "<li>" + link_to(t("backend.actions.edit"), edit_path) + "</li>" if can?(:edit, target)
    output += "<li>" + link_to('Destroy', target, confirm: I18n.t("backend.actions.are_you_sure"), method: :delete) + "</li>" if can?(:edit, target)

    output = '<div class="panel-admin">' + output + "</div>" unless output.nil?

    raw output
  end
end
