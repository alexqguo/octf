class AddTimestampsToAthletes < ActiveRecord::Migration
  def change
  	add_column :athletes, :created_at, :datetime
  	add_column :athletes, :updated_at, :datetime
  end
end
