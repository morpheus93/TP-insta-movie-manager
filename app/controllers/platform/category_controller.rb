class Platform::CategoryController < ApplicationController

	def get_all
		@categories = Category.all
	end

end
