class FixColsInMarks < ActiveRecord::Migration
  def change
    remove_column :marks, :season
    remove_column :marks, :event
    remove_column :marks, :mark
    
    add_column :marks, :season, :string
    add_column :marks, :event_name, :string
    add_column :marks, :mark, :float
  end
end
