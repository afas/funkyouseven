#encoding: utf-8
class Role
  attr_accessor :name
  attr_accessor :code

  def self.collection(admin)
    list = [
        Role.new(:name => 'Фанат', :code => 2),
        Role.new(:name => 'Пользователь', :code => 3),
    ]

    list = [
        Role.new(:name => 'Администратор', :code => 0),
        Role.new(:name => 'Редактор', :code => 1)
    ] + list if admin

    list
  end

  def self.include?(code)
    collection.each do |role|
      return true if role.code == code
    end
    false
  end

  def initialize(hash)
    self.name = hash[:name]
    self.code = hash[:code]
  end

end