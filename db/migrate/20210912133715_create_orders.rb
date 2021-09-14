class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|
      t.decimal :cost
      t.string :status
      t.belongs_to :user, foreign_key: true

      t.timestamps
    end
  end
end
