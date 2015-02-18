class CreateCoffeehouses < ActiveRecord::Migration
  def change
    create_table :coffeehouses do |t|
      t.string :name
      t.string :latitude
      t.string :longitude
      t.belongs_to :creator
      t.timestamps
    end
  end
end
