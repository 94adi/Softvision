class CreateRatios < ActiveRecord::Migration[5.1]
  def change
    create_table :ratios do |t|
      t.integer :currency_id
      t.float :value

      t.timestamps
    end
  end
end
