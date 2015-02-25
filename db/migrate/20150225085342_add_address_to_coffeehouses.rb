class AddAddressToCoffeehouses < ActiveRecord::Migration
  def change
    add_column :coffeehouses, :address, :string
  end
end
