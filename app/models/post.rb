class Post < ApplicationRecord
	validates :title, presence: true#, length: { minimum: 2, maximum: 13 }
	validates :slug, presence: true, uniqueness: true#, length: { minimum: 2, maximum: 13 }

	validates :url, presence: true#, length: { minimum: 2, maximum: 300 }

	extend FriendlyId
	friendly_id :title, use: :slugged

	def normalize_friendly_id(string)
		super[0..13]
	end
end
