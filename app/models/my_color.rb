#encoding: utf-8
class MyColor
  attr_accessor :name
  attr_accessor :code

  def self.collection()
    [
        MyColor.new(:name => 'Черный', :code => 'black'),
        MyColor.new(:name => 'Красный', :code => 'red'),
        MyColor.new(:name => 'Зеленый', :code => '#11FF17'),
        MyColor.new(:name => 'Синий', :code => '#0054FF')
    ]
  end

  def initialize(hash)
    self.name = hash[:name]
    self.code = hash[:code]
  end

  def self.by_code(code)
    collection.each do |value|
      return value.name if value.code == code
    end
    false
  end


end