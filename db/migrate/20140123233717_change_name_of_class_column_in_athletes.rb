class ChangeNameOfClassColumnInAthletes < ActiveRecord::Migration
  def change
    remove_column :athletes, :class
    add_column :athletes, :graduating_class, :integer
  end
end
