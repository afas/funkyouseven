require "digest/sha1"

class Utils


  def self.generate_name
    Digest::SHA1.hexdigest(Time.now.to_s)
  end

  def self.style_geometry(target, style)
    Paperclip::Geometry.parse(target.image.styles[style].geometry)
  end

  def self.file_geometry(target, style)
    @geometry ||= {}
    @geometry[style] ||= Paperclip::Geometry.from_file(target.image.path(style))
  end

  def self.reprocess_image(target)
    target.image.reprocess!
  end

end