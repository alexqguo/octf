class AddUrlToAthletes < ActiveRecord::Migration
  def change
    add_column :athletes, :url, :string
  end
end
