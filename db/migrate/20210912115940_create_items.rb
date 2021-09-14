class CreateItems < ActiveRecord::Migration[6.1]
  def change
    create_table :items do |t|
      t.string :name, null: false
      t.string :photo_url, null: false
      t.integer :stocks, null: false
      t.decimal :price, null: false

      t.timestamps
    end
  end
end
