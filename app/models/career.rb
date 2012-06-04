#encoding: utf-8
class Career
  attr_accessor :name
  attr_accessor :cut

  def self.collection
    list = [
        Career.new(:name => 'Сноуборд', :cut => 0),
        Career.new(:name => 'Вейкборд', :cut => 1),
        Career.new(:name => 'Серф', :cut => 2),
        Career.new(:name => 'Скейтборд', :cut => 3),
        Career.new(:name => 'Ролики', :cut => 4),
        Career.new(:name => 'Велосипед', :cut => 5),
        Career.new(:name => 'Мотоцикл', :cut => 6),
        Career.new(:name => 'другой ...', :cut => 7)
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