class Post < ActiveRecord::Base
  attr_accessible :author_id, :content, :description, :short_url, :title, :created_at, :preview_id, :video_emb, :main_article, :cover_id

  attr_writer :preview_id, :emb_checked
  attr_reader :preview_id, :emb_checked

  self.per_page = 6

  belongs_to :author, :class_name => 'User'
  belongs_to :cover_magazine
  #, :foreign_key => :cover_id# :class_name => 'Cover'

  has_many :post_images

  validates_presence_of :title, :description, :content, :author_id
  validates_uniqueness_of :title, :short_url

  #default_scope order("created_at DESC")
  scope :side_bar, order("created_at DESC").limit(3)
  scope :article_side_bar, lambda { |post| where("id <> ?", post.id).order("created_at DESC").limit(3) }
  #scope :magazine_list, order("created_at DESC")
  scope :without_magazine, where(:cover_id => 0).order("created_at DESC")

  before_save :generate_short_url

  after_create :update_attachements, :check_video_emb
  after_update :check_video_emb


  def initialize(*args)
    super
    self.cover_id = CoverMagazine.all.first().id if self.new_record? && !CoverMagazine.all.first().nil?
    self.preview_id = rand(99999999)+99999999 if self.preview_id.nil? && self.new_record?
  end

  def get_id
    self.id || self.preview_id
  end

  def get_cover
    cover_images = PostImage.find_all_by_post_id_and_cover(self.id, true)

    unless cover_images.empty?
      cover_images[rand(cover_images.size())]
    else
      PostImage.find_by_post_id(self.id) || PostImage.new
    end
  end

  def get_preview
    preview_images = PostImage.find_all_by_post_id_and_preview(self.id, true)

    unless preview_images.empty?
      preview_images[rand(preview_images.size())]
    else
      PostImage.find_by_post_id(self.id) || PostImage.new
    end
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

  def check_video_emb
    if self.emb_checked.nil?
      self.emb_checked = true
      self.video_emb = self.content.include?("</iframe>") || self.content.include?("</object>")
    end
  end

  def generate_short_url
    self.short_url = Russian.transliterate(self.title.downcase.gsub(' ', '-')) if self.short_url.blank? && !self.title.blank?
  end
end
