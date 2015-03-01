class DropAddressColumn < ActiveRecord::Migration
  def change
    remove_column :coffeehouses, :address
  end
end
