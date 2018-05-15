class RenameValueToRatioFromRatios < ActiveRecord::Migration[5.1]
  def self.up
  	rename_column :ratios, :value, :ratio
  end

  def self.down
  	rename_column :ratios, :ratio, :value
  end
end
