#encoding: utf-8
class CreateBrands < ActiveRecord::Migration
  def change
    create_table :brands do |t|
      t.string :name
      t.text :description
      t.string :short_url
      t.string :site_url

      t.string :logo_file_name
      t.string :logo_content_type
      t.integer :logo_file_size

      t.timestamps
    end

    add_index :brands, :name
    add_index :brands, :short_url

    Brand.create(:name => "686", :short_url => "686", :site_url => "http://686.com")
    Brand.create(:name => "2b", :short_url => "2b", :site_url => "http://2b.com")
    Brand.create(:name => "Addict", :short_url => "Addict", :site_url => "http://addict.com")
    Brand.create(:name => "Alife", :short_url => "Alife", :site_url => "http://alife.com")
    Brand.create(:name => "Analog", :short_url => "Analog", :site_url => "http://analog.com")
    Brand.create(:name => "Anteater clothing", :short_url => "Anteater clothing", :site_url => "http://anteater clothing.com")
    Brand.create(:name => "Atreebutes", :short_url => "Atreebutes", :site_url => "http://atreebutes.com")
    Brand.create(:name => "Bluecrown", :short_url => "Bluecrown", :site_url => "http://bluecrown.com")
    Brand.create(:name => "Burton", :short_url => "Burton", :site_url => "http://burton.com")
    Brand.create(:name => "Cartel ", :short_url => "Cartel ", :site_url => "http://cartel .com")
    Brand.create(:name => "Custom", :short_url => "Custom", :site_url => "http://custom.com")
    Brand.create(:name => "DC", :short_url => "DC", :site_url => "http://dc.com")
    Brand.create(:name => "Dragon", :short_url => "Dragon", :site_url => "http://dragon.com")
    Brand.create(:name => "Fencherch", :short_url => "Fencherch", :site_url => "http://fencherch.com")
    Brand.create(:name => "Fiction", :short_url => "Fiction", :site_url => "http://fiction.com")
    Brand.create(:name => "Funk You 7", :short_url => "fu7", :site_url => "http://funkyou7.ru")
    Brand.create(:name => "Gravis", :short_url => "Gravis", :site_url => "http://gravis.com")
    Brand.create(:name => "Grenade", :short_url => "Grenade", :site_url => "http://grenade.com")
    Brand.create(:name => "Independent", :short_url => "Independent", :site_url => "http://independent.com")
    Brand.create(:name => "Lakai", :short_url => "Lakai", :site_url => "http://lakai.com")
    Brand.create(:name => "Litle", :short_url => "Litle", :site_url => "http://litle.com")
    Brand.create(:name => "Lsd", :short_url => "Lsd", :site_url => "http://lsd.com")
    Brand.create(:name => "Makia", :short_url => "Makia", :site_url => "http://makia.com")
    Brand.create(:name => "Matix", :short_url => "Matix", :site_url => "http://matix.com")
    Brand.create(:name => "Neff", :short_url => "Neff", :site_url => "http://neff.com")
    Brand.create(:name => "Nikita", :short_url => "Nikita", :site_url => "http://nikita.com")
    Brand.create(:name => "Nomis", :short_url => "Nomis", :site_url => "http://nomis.com")
    Brand.create(:name => "Quiksilver", :short_url => "Quiksilver", :site_url => "http://quiksilver.com")
    Brand.create(:name => "Rebels", :short_url => "Rebels", :site_url => "http://rebels.com")
    Brand.create(:name => "Sanuke", :short_url => "Sanuke", :site_url => "http://sanuke.com")
    Brand.create(:name => "Shape", :short_url => "Shape", :site_url => "http://shape.com")
    Brand.create(:name => "Spy", :short_url => "Spy", :site_url => "http://spy.com")
    Brand.create(:name => "Supra", :short_url => "Supra", :site_url => "http://supra.com")
    Brand.create(:name => "Technine", :short_url => "Technine", :site_url => "http://technine.com")
    Brand.create(:name => "Terror", :short_url => "Terror", :site_url => "http://terror.com")
    Brand.create(:name => "Thirtytwo", :short_url => "Thirtytwo", :site_url => "http://thirtytwo.com")
    Brand.create(:name => "Union", :short_url => "Union", :site_url => "http://union.com")
    Brand.create(:name => "Vans", :short_url => "Vans", :site_url => "http://vans.com")
    Brand.create(:name => "Volcom", :short_url => "Volcom", :site_url => "http://volcom.com")
    Brand.create(:name => "Wesc", :short_url => "Wesc", :site_url => "http://wesc.com")
    Brand.create(:name => "Yoba", :short_url => "Yoba", :site_url => "http://yoba.com")
    Brand.create(:name => "Абсурд", :short_url => "Абсурд", :site_url => "http://absourd.ru")
    Brand.create(:name => "Юнион", :short_url => "Юнион", :site_url => "http://unionskateboards.ru")
  end
end
