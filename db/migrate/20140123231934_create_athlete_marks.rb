class CreateAthleteMarks < ActiveRecord::Migration
  def change
    create_table :athlete_marks do |t|
      t.integer :athlete_id, null: false
      t.integer :mark_id, null: false

      t.timestamps
    end
    
    add_index :athlete_marks, :athlete_id
    add_index :athlete_marks, :mark_id
  end
end
