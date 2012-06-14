#encoding: utf-8
class LogoClass
  attr_accessor :name
  attr_accessor :code
  attr_accessor :class
  attr_accessor :controller

  def self.collection()
    [
        LogoClass.new(:name => 'Default', :code => 0, :class => "", :controller => "welcomes"),
        LogoClass.new(:name => 'Default', :code => 1, :class => "", :controller => "statics"),
        LogoClass.new(:name => 'shop', :code => 2, :class => "shop", :controller => "products"),
        LogoClass.new(:name => 'shop', :code => 3, :class => "shop", :controller => "brands"),
        LogoClass.new(:name => 'shop', :code => 4, :class => "shop", :controller => "basket"),
        LogoClass.new(:name => 'mag', :code => 5, :class => "mag", :controller => "posts")
    ]
  end

  def initialize(hash)
    self.name = hash[:name]
    self.code = hash[:code]
    self.class = hash[:class]
    self.controller = hash[:controller]
  end

  def self.by_code(code)
    collection.each do |value|
      return value.name if value.code == code
    end
    false
  end

  def self.class_by_controller(controller_name)
    collection.each do |value|
      #puts value.controller
      return value.class if value.controller == controller_name
    end
    ""
  end


end