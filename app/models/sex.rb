#encoding: utf-8
class Sex
  attr_accessor :name
  attr_accessor :code

  def self.collection()
    [
        Sex.new(:name => 'Мужской', :code => 0),
        Sex.new(:name => 'Женский', :code => 1),
        Sex.new(:name => 'Детский', :code => 2)
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