Rails.application.routes.draw do
	root 'posts#index'

	resources :posts
	# Otro Post#show 
	get "λ/:id", to: "posts#show"
end