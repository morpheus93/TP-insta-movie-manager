class Admin::MoviesController < ApplicationController
	before_action :authenticate_user! # User need to be authenticated
	before_action :check_user_rights # User need to be admin
	before_action :set_movie, only: [:show, :edit, :update, :destroy]

	def index
		@movies = Movie.page(params['page']).per(24)
	end

	def show
	end

	def new
		@movie = Movie.new
	end

	def edit
	end

	def create
		@movie = Movie.new(movie_params)

		respond_to do |format|
			if @movie.save
				format.html { redirect_to admin_movies_path, notice: 'Movie was successfully created.' }
			else
				format.html { render :new }
			end
		end
	end

	def update
		respond_to do |format|
			if @movie.update(movie_params)
				format.html { redirect_to admin_movies_path, notice: 'Movie was successfully updated.' }
			else
				format.html { render :edit }
			end
		end
	end

	def destroy
		@movie.destroy
		respond_to do |format|
			format.html { redirect_to admin_movies_path, notice: 'Movie was successfully destroyed.' }
		end
	end

	private
	def set_movie
		@movie = Movie.friendly.find(params[:slug])
	end

	def movie_params
		params.require(:movie).permit(:name, :description, :url_thumbnail, :url_video, :note, :category_id)
	end

	private
	def check_user_rights
		if current_user && !current_user.admin?
			redirect_to root_path
		end
	end

end
