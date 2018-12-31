class ChangeClassColumnToName < ActiveRecord::Migration[5.2]
  def change
    rename_column :workflows, :class, :name
  end
end
