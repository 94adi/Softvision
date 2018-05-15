class CreateAmmounts < ActiveRecord::Migration[5.1]
  def change
    create_table :ammounts do |t|
      t.integer :user_id
      t.float :quantity
      t.integer :currency_id

      t.timestamps
    end
  end
end
