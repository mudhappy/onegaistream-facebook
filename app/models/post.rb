class Post < ApplicationRecord
	validates :title, presence: true, uniqueness: true
	validates :slug, presence: true, uniqueness: true
	
	validates :url, presence: true

	extend FriendlyId
	friendly_id :title, use: :slugged
end
