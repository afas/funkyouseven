class CoverMagazine < ActiveRecord::Base
  attr_accessible :columns, :columns_html_data, :cover_css, :cover_html, :cover_js, :release_date, :sequence_number, :special, :special_html_data, :subject, :subject_html_data, :title, :title_html_data, :year_number, :title_font_data

  has_many :articles, :class_name => 'Post', :foreign_key => :cover_id

  scope :last_number, where("cover_magazines.release_date < ?", DateTime.now).order("id DESC").limit(1)
  scope :last_number_admin, order("id DESC").limit(1)
  default_scope order("id DESC")

  def initialize(*args)
    super
    if self.new_record?

      self.title = I18n.t("activerecord.attributes.cover_magazine.title")
      self.subject = I18n.t("activerecord.attributes.cover_magazine.subject")
      self.special = I18n.t("activerecord.attributes.cover_magazine.special")
      self.columns = I18n.t("activerecord.attributes.cover_magazine.columns")

      self.sequence_number = 1 + CoverMagazine.last_number.first().sequence_number unless CoverMagazine.last_number.empty?
      self.year_number = 1 + CoverMagazine.last_number.first().year_number unless CoverMagazine.last_number.empty?
    end
  end

  def self.new_from_post(post_id)
    post = self.new

    main_article = Post.find(post_id)
    post.title = main_article.title
    post.subject = main_article.description
    return post
  end

  def get_cover
    self.main_article.get_cover() unless self.main_article.nil?
  end

  def main_article
    Post.find_by_cover_id_and_main_article(self.id, true)
  end

end
