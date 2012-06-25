#encoding: utf-8
class CreateWelcomes < ActiveRecord::Migration
  def change
    create_table :welcomes do |t|
      t.string :title
      t.text :description
      t.string :mail
      t.string :phone

      t.timestamps
    end

    Welcome.create( :title => "Wear, Boards, Bikes",
                    :description => "<p>Мы решили сделать этот проект потому что нам нехватало определенных вещей в нашей жизни. Так вышло что мы узнали что тех же вещей нехватает нашим друзьям а также у нас есть знакомые дизайнеры которые нам очень нравятся, они делают отличные вещи и мы хотели бы собрать их здесь , может они понравятся и вам.</p><span> Женя и Илья</span>",
                    :mail => "shop@funkyou7.ru",
                    :phone => "+7 903 530 30 43"
    )
  end
end
