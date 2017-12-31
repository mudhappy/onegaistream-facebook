class PostsController < ApplicationController
	def index
		@post = Post.new
	end

	def create 
		@post = Post.new(strong_params)
		if @post.save
			redirect_to @post
		else
			redirect_to posts_path
		end
	end

	def show
		@post = Post.friendly.find(params[:id])
	end



	private 

	def strong_params
		params.require(:post).permit(:title, :url)
	end
end
