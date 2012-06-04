#encoding: utf-8
class ProductSize
  attr_accessor :name
  attr_accessor :cut

  def self.collection
    list = [
        ProductSize.new(:name => 'S', :cut => 0),
        ProductSize.new(:name => 'M', :cut => 1),
        ProductSize.new(:name => 'L', :cut => 2),
        ProductSize.new(:name => 'XL', :cut => 3),
        ProductSize.new(:name => 'XXL', :cut => 4)
    ]
    list
  end

  def self.by_code(code)
    collection.each do |value|
      return value.name if value.code == code
    end
    false
  end

  def initialize(hash)
    self.name = hash[:name]
    self.cut = hash[:cut]
  end

end