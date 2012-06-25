#encoding: utf-8
class Career
  attr_accessor :name
  attr_accessor :code

  def self.collection
    list = [
        Career.new(:name => 'Сноуборд', :code => 0),
        Career.new(:name => 'Вейкборд', :code => 1),
        Career.new(:name => 'Серф', :code => 2),
        Career.new(:name => 'Скейтборд', :code => 3),
        Career.new(:name => 'Ролики', :code => 4),
        Career.new(:name => 'Велосипед', :code => 5),
        Career.new(:name => 'Мотоцикл', :code => 6),
        Career.new(:name => 'другой ...', :code => 55)
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