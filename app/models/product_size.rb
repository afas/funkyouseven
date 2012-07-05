#encoding: utf-8
class ProductSize
  attr_accessor :name
  attr_accessor :code
  attr_accessor :type

   def self.collection(type)
    list = []
    if type == "wear" || type == "all"
      list += [
          ProductSize.new(:name => 'XS', :code => 0, :type => 0),
          ProductSize.new(:name => 'S', :code => 1, :type => 0),
          ProductSize.new(:name => 'M', :code => 2, :type => 0),
          ProductSize.new(:name => 'L', :code => 3, :type => 0),
          ProductSize.new(:name => 'XL', :code => 4, :type => 0)
      ]
    end
    if type == "shoes" || type == "all"
      list += [
          ProductSize.new(:name => '36', :code => 5, :type => 1),
          ProductSize.new(:name => '37', :code => 6, :type => 1),
          ProductSize.new(:name => '38', :code => 7, :type => 1),
          ProductSize.new(:name => '39', :code => 8, :type => 1),
          ProductSize.new(:name => '40', :code => 9, :type => 1),
          ProductSize.new(:name => '41', :code => 10, :type => 1),
          ProductSize.new(:name => '42', :code => 11, :type => 1),
          ProductSize.new(:name => '43', :code => 12, :type => 1),
          ProductSize.new(:name => '44', :code => 13, :type => 1),
          ProductSize.new(:name => '45', :code => 14, :type => 1),
          ProductSize.new(:name => '46', :code => 15, :type => 1)
      ]
    end
    list
   end

  def self.by_code(code)
    collection("all").each do |value|
      return value.name if value.code == code
    end
    false
  end

  def self.get_product_size_by_code(code)
    collection("all").each do |value|
      return value if value.code == code
    end
    false
  end

  def initialize(hash)
    self.name = hash[:name]
    self.code = hash[:code]
    self.type = hash[:type]
  end

end