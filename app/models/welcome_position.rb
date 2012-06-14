#encoding: utf-8
class WelcomePosition
  attr_accessor :name
  attr_accessor :code

  def self.collection
    list = [
        WelcomePosition.new(:name => 'Топ слайдер', :code => 0),
        WelcomePosition.new(:name => 'Слева от ыбаута', :code => 1),
        WelcomePosition.new(:name => 'Две позиции под ыбаутом', :code => 2),
        WelcomePosition.new(:name => 'Слайдер #2', :code => 3),
        WelcomePosition.new(:name => 'Last', :code => 4)
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