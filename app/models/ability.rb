class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new

    can :manage, :all if user.admin?
    #can :import_catalog, Product

    unless user.new_record?
      can [:edit, :destroy], Post do |post|
        post.author_id == user.id
      end
      can :edit, Order do |order|
        order.user_id == user.id
      end
    end
    can :home, Welcome
    can :create, Order
    can [:page, :sex, :career], Product
    can :read, :all

  end
end
