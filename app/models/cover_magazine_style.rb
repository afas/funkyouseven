#encoding: utf-8
class CoverMagazineStyle
  attr_accessor :name
  attr_accessor :code

  def self.collection()
    [
        CoverMagazineStyle.new(:name => 'Тонкий', :code => 'cover_magazine_light'),
        CoverMagazineStyle.new(:name => 'Высокий', :code => 'cover_magazine_heigh'),
        CoverMagazineStyle.new(:name => 'Для денег', :code => 'cover_magazine_money'),
        CoverMagazineStyle.new(:name => 'Синий стиль', :code => 'Blue')
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