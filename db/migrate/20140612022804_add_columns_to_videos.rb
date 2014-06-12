class AddColumnsToVideos < ActiveRecord::Migration
  def change
  	add_column :videos, :title, :string, null: false
  	add_column :videos, :author, :string, null: false
  	add_column :videos, :duration, :string, null: false
  	add_column :videos, :uid, :string, null: false
  end
end
