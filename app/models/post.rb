class Post < ActiveRecord::Base

  self.per_page = 12

  belongs_to :author, :class_name => 'User'

  validates_presence_of :title, :description, :content, :author_id
  validates_uniqueness_of :title, :short_url

  before_save :generate_short_url

  attr_accessible :author_id, :content, :description, :short_url, :title, :created_at

  scope :journal_home, order("created_at DESC").limit(3)

  scope :journal_list, order("created_at DESC")


  private

  def generate_short_url
    self.short_url = Russian.transliterate(self.title.gsub(' ', '-')) if self.short_url.blank? && !self.title.blank?
  end

end
