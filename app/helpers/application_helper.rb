module ApplicationHelper
  def meta_tags(unit)
    content_for(:title) { unit.seo_title.blank? ? "#{unit.title} :: #{t('site_name')}" : unit.seo_title }
    content_for(:description) { unit.seo_description.blank? ? "#{unit.title} ~ #{t('site_name')}" : unit.seo_description }
    content_for(:keywords) { unit.seo_keywords.blank? ? "#{unit.title} ~ #{t('site_name')}" : unit.seo_keywords }
  end
end
