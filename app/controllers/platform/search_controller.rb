class Platform::SearchController < ApplicationController
	def search
    search = params['search_param']
    @movies = Movie.where('name LIKE "%' + search.to_s + '%"')
  end
end
