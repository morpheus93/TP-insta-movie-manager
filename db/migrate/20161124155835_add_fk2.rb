class AddFk2 < ActiveRecord::Migration
  def change
	  add_foreign_key  :note_movies, :movies
	  add_foreign_key  :note_movies, :users

  end
end
