#encoding: utf-8
class Role
  attr_accessor :name
  attr_accessor :cut

  def self.collection(admin)
    list = [
        Role.new(:name => 'Фанат', :cut => 2),
        Role.new(:name => 'Пользователь', :cut => 3),
    ]

    list = [
        Role.new(:name => 'Администратор', :cut => 0),
        Role.new(:name => 'Редактор', :cut => 1)
    ] + list if admin

    list
  end

  def self.include?(cut)
    collection.each do |role|
      return true if role.cut == cut
    end
    false
  end

  def initialize(hash)
    self.name = hash[:name]
    self.cut = hash[:cut]
  end

end