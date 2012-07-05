#encoding: utf-8
class PayStatus
  attr_accessor :name
  attr_accessor :code

  def self.collection
    list = [
        PayStatus.new(:name => 'Оплачен', :code => 123),
        PayStatus.new(:name => 'Срок дествия платежного инструмента истек', :code => 456),
        PayStatus.new(:name => 'Недостаточно средств', :code => 789)
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