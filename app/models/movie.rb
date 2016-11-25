class Movie < ActiveRecord::Base
	extend FriendlyId
	friendly_id :slug_candidates, use: :slugged

	has_one :category, :class_name => 'Category', :foreign_key => 'id', :primary_key => 'category_id', :dependent => :destroy
	belongs_to :comment,  :dependent => :destroy

	def slug_candidates
		[
				:name,
				[:name, :description],
				[:id, :name, :description]
		]
	end
end
