class RemoveGenderColumnFromAthletes < ActiveRecord::Migration
  def change
    remove_column :athletes, :gender
  end
end
