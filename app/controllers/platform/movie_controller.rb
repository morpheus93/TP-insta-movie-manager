class Platform::MovieController < ApplicationController

	def get_all
		@movies = Movie.page(params['page']).per(24)
	end

	def get_one
		@slug = params['slug']
		@movie = Movie.friendly.find(@slug)
		@comments = Comment.where('movie_id = '+ @movie.id.to_s)
		@note = NoteMovie.where('movie_id = '+ @movie.id.to_s).average(:note)
		@similarMovies = Movie.where('category_id =' + @movie.category.id.to_s + ' AND id != ' + @movie.id.to_s).order('RAND()').limit(3)
		@new_comment = Comment.new

	end

	def add_comment
		@slug = params['slug']
		@movie = Movie.friendly.find(@slug)
		parameters = params.require(:comment).permit(:comment)
		parameters['movie_id'] = @movie.id
		parameters['user_id'] = current_user.id
		@comment = Comment.new(parameters)
		respond_to do |format|
			if @comment.save
				format.html { redirect_to platform_movie_path(@movie.slug) }
			end
		end
	end

	def get_categories
		@slug = params['slug']
		category = Category.friendly.find(@slug)
		@movies = Movie.where('category_id = ' + category.id.to_s).page(params['page']).per(24)
	end
end
