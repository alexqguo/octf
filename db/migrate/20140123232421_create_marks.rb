class CreateMarks < ActiveRecord::Migration
  def change
    create_table :marks do |t|
      t.string :event, null: false
      t.integer :year, null: false
      t.integer :mark, null: false
      t.integer :season, null: false

      t.timestamps
    end
  end
end
