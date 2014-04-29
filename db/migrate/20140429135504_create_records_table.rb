class CreateRecordsTable < ActiveRecord::Migration
  def change
  	create_table :records do |t|
  		t.string :gender, null: false
  		t.string :season, null: false
  		t.string :event, null: false
  		t.string :mark, null: false
  		t.string :record_holder, null: false
  		t.string :date_set, null: false
  		t.string :notes


  		t.timestamps
  	end
  end
end
