class AddMovieInfos < ActiveRecord::Migration
	def change
		add_column :movies, :release, :string
		add_column :movies, :director, :string
		add_column :movies, :writer, :string
		add_column :movies, :actor, :string
	end
end
