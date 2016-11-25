class HomeController < ApplicationController
	def index
		@movies = Movie.order('created_at DESC').limit(24)
	end
end
