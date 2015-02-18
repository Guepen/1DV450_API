class CreateApikeys < ActiveRecord::Migration
  def change
    create_table :apikeys do |t|
      t.string :key
      t.belongs_to :user
      t.timestamps
    end
  end
end
