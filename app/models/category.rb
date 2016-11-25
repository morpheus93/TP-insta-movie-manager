class Category < ActiveRecord::Base
	extend FriendlyId
	friendly_id :slug_candidates, use: :slugged

	belongs_to :movie

	def slug_candidates
		[
				:name,
				[:id, :name]
		]
	end
end
