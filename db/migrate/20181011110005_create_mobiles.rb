class CreateMobiles < ActiveRecord::Migration[5.1]
  def change
    create_table :mobiles do |t|
      t.text :name
      t.text :size
      t.integer :price

      t.timestamps
    end
  end
end
