class CreateWelcomes < ActiveRecord::Migration
  def change
    create_table :welcomes do |t|
      t.string :title
      t.text :description
      t.string :mail
      t.string :phone

      t.timestamps
    end

    Welcome.create( :title => "Wear, Boards, Bikes", :description => "FunkYou7 official site v1.0<br/>Wear, Boards, Bikes<br/>Build your style", :mail => "shop@funkyou7.ru", :phone => "+7 903 530 30 43" )
  end
end
