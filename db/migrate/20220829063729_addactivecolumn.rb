class Addactivecolumn < ActiveRecord::Migration[7.0]
  def change
    add_column :properties , :inactive, :boolean
  end
end
