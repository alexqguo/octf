class AddAthletesTable < ActiveRecord::Migration
  def change
    create_table :athletes do |t|
      t.string :name, null: false
      t.string :gender, null: false
      t.integer :class, null: false
    end
  end
end
