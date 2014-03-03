class AddSlugToAthletes < ActiveRecord::Migration
  def change
    add_column :athletes, :slug, :string
    add_index :athletes, :slug
  end
end
