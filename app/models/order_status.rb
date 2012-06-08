#encoding: utf-8
class OrderStatus
  attr_accessor :name
  attr_accessor :code

  def self.collection
    list = [
        OrderStatus.new(:name => 'Новый', :code => 0),
        OrderStatus.new(:name => 'Формируется', :code => 1),
        OrderStatus.new(:name => 'Осуществляется доставка', :code => 2),
        OrderStatus.new(:name => 'Успешно выполнен', :code => 3),
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