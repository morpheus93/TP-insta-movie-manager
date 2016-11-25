class Movie < ActiveRecord::Base
	extend FriendlyId
	friendly_id :slug_candidates, use: :slugged

	has_one :category, :class_name => 'Category', :foreign_key => 'id', :primary_key => 'category_id'
	belongs_to :comment

	def slug_candidates
		[
				:name,
				[:name, :description],
				[:id, :name, :description]
		]
	end
end
