class ChangeLatLongToFloat < ActiveRecord::Migration
  def change
    change_column :coffeehouses, :latitude, :float
    change_column :coffeehouses, :longitude, :float
  end
end
