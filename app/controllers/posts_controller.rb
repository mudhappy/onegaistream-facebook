class PostsController < ApplicationController
	def index
		@post = Post.new
	end

	def create 
		@post = Post.new(strong_params)
		if @post.save
	      respond_to do |format|      
	      	format.html { redirect_to @post, notice: 'El post fue creado!' }
	        format.js 
	      end
	    end
	end

	def show
		@post = Post.friendly.find(params[:id])
		@post.incrementa_visita

		@video_exist = (@post.url.start_with?("https://video.flim")) ? true : false 
	end



	private 

	def strong_params
		params.require(:post).permit(:title, :url)
	end
end
