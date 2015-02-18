class CreateCoffeehousesTags < ActiveRecord::Migration
  def change
    create_table :coffeehouses_tags, id: false do |t|
      t.belongs_to :coffeehouse, index: true
      t.belongs_to :tag, index: true
    end
  end
end
