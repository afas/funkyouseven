#encoding: utf-8
class OrderStatus
  attr_accessor :name
  attr_accessor :code

  def self.collection
    list = [
        OrderStatus.new(:name => 'Новый', :code => 0),
        OrderStatus.new(:name => 'Комплектуется', :code => 1),
        OrderStatus.new(:name => 'Доставка', :code => 2),
        OrderStatus.new(:name => 'Выполнен', :code => 3),
        OrderStatus.new(:name => 'Troubles', :code => 4)
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