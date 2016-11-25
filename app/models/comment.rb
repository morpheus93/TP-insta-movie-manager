class Comment < ActiveRecord::Base
	has_one :user, :class_name => 'User', :foreign_key => 'id', :primary_key => 'user_id',  :dependent => :destroy
	has_one :movie, :class_name => 'Movie', :foreign_key => 'id', :primary_key => 'movie_id',  :dependent => :destroy

end
