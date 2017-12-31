Rails.application.routes.draw do
	root 'posts#index'

	resources :posts
	# Otro Post#show 
	get "v/:id", to: "posts#show"
end