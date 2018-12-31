class CreateWorkflows < ActiveRecord::Migration[5.2]
  def change
    create_table :workflows do |t|
      t.string :class, :limit => 50
      t.string :metadata
      t.string :status, polymorphic: true, :limit => 50
      t.timestamps
    end
  end
end
