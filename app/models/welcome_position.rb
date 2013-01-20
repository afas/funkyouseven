#encoding: utf-8
class WelcomePosition
  attr_accessor :name
  attr_accessor :code

  def self.collection
    list = [
        WelcomePosition.new(:name => 'Первый слайдер', :code => 0),
        WelcomePosition.new(:name => 'Под слайдером', :code => 1),
        WelcomePosition.new(:name => 'Под описанием', :code => 2),
        WelcomePosition.new(:name => 'Второй слайдер', :code => 3),
        WelcomePosition.new(:name => 'Самый низ', :code => 4)
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