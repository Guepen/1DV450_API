class AddStreetCityZipcodeToCoffeehouses < ActiveRecord::Migration
  def change
    add_column :coffeehouses, :street, :string
    add_column :coffeehouses, :city, :string
    add_column :coffeehouses, :zipcode, :string
  end
end
