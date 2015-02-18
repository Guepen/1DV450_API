class CreateCreators < ActiveRecord::Migration
  def change
    create_table :creators do |t|
      t.string :firstName
      t.string :lastName
      t.string :username
      t.string :password_digest
      t.timestamps
    end
  end
end
