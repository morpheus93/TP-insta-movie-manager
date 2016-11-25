class Admin::MoviesController < ApplicationController
	before_action :authenticate_user! # User need to be authenticated
	before_action :check_user_rights # User need to be admin
	before_action :set_movie, only: [:show, :edit, :update, :destroy]

	# GET /movies
	# GET /movies.json
	def index
		@movies = Movie.page(params['page']).per(24)
	end

	# GET /movies/1
	# GET /movies/1.json
	def show
	end

	# GET /movies/new
	def new
		@movie = Movie.new
	end

	# GET /movies/1/edit
	def edit
	end

	# POST /movies
	def create
		@movie = Movie.new(movie_params)

		respond_to do |format|
			if @movie.save
				format.html { redirect_to @movie, notice: 'Movie was successfully created.' }
				format.json { render :show, status: :created, location: @movie }
			else
				format.html { render :new }
				format.json { render json: @movie.errors, status: :unprocessable_entity }
			end
		end
	end

	# PATCH/PUT /movies/1
	# PATCH/PUT /movies/1.json
	def update
		respond_to do |format|
			if @movie.update(movie_params)
				format.html { redirect_to @movie, notice: 'Movie was successfully updated.' }
				format.json { render :show, status: :ok, location: @movie }
			else
				format.html { render :edit }
				format.json { render json: @movie.errors, status: :unprocessable_entity }
			end
		end
	end

	# DELETE /movies/1
	# DELETE /movies/1.json
	def destroy
		@movie.destroy
		respond_to do |format|
			format.html { redirect_to movies_url, notice: 'Movie was successfully destroyed.' }
			format.json { head :no_content }
		end
	end

	private
	# Use callbacks to share common setup or constraints between actions.
	def set_movie
		@movie = Movie.friendly.find(params[:slug])
	end

	# Never trust parameters from the scary internet, only allow the white list through.
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
