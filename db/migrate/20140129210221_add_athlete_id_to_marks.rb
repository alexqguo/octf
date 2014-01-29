class AddAthleteIdToMarks < ActiveRecord::Migration
  def change
    add_column :marks, :athlete_id, :integer, null: false
  end
end
