#encoding: utf-8
class ProductSize
  attr_accessor :name
  attr_accessor :code

  def self.collection
    list = [
        ProductSize.new(:name => 'S', :code => 0),
        ProductSize.new(:name => 'M', :code => 1),
        ProductSize.new(:name => 'L', :code => 2),
        ProductSize.new(:name => 'XL', :code => 3),
        ProductSize.new(:name => 'XXL', :code => 4)
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
    self.code = hash[:code]
  end

end