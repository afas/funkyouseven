class Post < ActiveRecord::Base

  self.per_page = 12

  belongs_to :author, :class_name => 'User'
  has_many :post_images

  validates_presence_of :title, :description, :content, :author_id
  validates_uniqueness_of :title, :short_url

  attr_accessible :author_id, :content, :description, :short_url, :title, :created_at, :preview_id
  attr_writer :preview_id
  attr_reader :preview_id

  default_scope order("created_at DESC")
  scope :journal_home, order("created_at DESC").limit(3)
  scope :journal_list, order("created_at DESC")

  before_save :generate_short_url
  after_create :update_attachements

  def initialize(*args)
    super
    self.preview_id = rand(99999999)+99999999 if self.preview_id.nil? && self.new_record?
  end

  def get_id
    self.id || self.preview_id
  end

  private

  def update_attachements
    unless self.preview_id.nil?
      images = PostImage.find_all_by_post_id(self.preview_id)
      images.each do |image|
        image.post_id = self.id
        image.save
      end
    end
  end

  def generate_short_url
    self.short_url = Russian.transliterate(self.title.gsub(' ', '-')) if self.short_url.blank? && !self.title.blank?
  end
end