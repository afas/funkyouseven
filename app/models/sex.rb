#encoding: utf-8
class Sex
  attr_accessor :name
  attr_accessor :code
  attr_accessor :short_name

  def self.collection()
    [
        Sex.new(:name => 'Мужской', :code => 0, :short_name => "муж"),
        Sex.new(:name => 'Женский', :code => 1, :short_name => "жен"),
        Sex.new(:name => 'Унисекс', :code => 2, :short_name => "уни")
        #Sex.new(:name => 'Детский', :code => 3, :short_name => "дет")
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

  def self.by_short_name(short_name)
    collection.each do |value|
      return value.code if value.short_name == short_name
    end
    false
  end


end