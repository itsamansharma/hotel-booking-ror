class Renamecolumn < ActiveRecord::Migration[7.0]
  def change
      rename_column :properties, :lat, :price
      rename_column :properties, :long, :pin
  end
end
