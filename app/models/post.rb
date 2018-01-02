class Post < ApplicationRecord
	before_validation :set_empty_title

	validates :title, length: { maximum: 13 }
	validates :slug, presence: true, uniqueness: true, length: { maximum: 13 }

	validates :url, presence: true#, length: { minimum: 2, maximum: 300 }

	extend FriendlyId
	friendly_id :title, use: :slugged

	private 

	def set_empty_title
		self.title = [*('a'..'z'),*('0'..'9')].shuffle[0,5].join
	end
	
end
