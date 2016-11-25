class Platform::MovieController < ApplicationController

	def get_all
		@movies = Movie.page(params['page']).per(24)
	end

	def get_one
		response.headers['X-FRAME-OPTIONS'] = ''
		@slug = params['slug']
		@movie = Movie.friendly.find(@slug)
		@comments = Comment.where('movie_id = '+ @movie.id.to_s)
		@note = NoteMovie.where('movie_id = '+ @movie.id.to_s).average(:note)
		@similarMovies = Movie.where('category_id =' + @movie.category.id.to_s + ' AND id != ' + @movie.id.to_s).order('RAND()').limit(3)
	end

end
