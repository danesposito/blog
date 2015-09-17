class PostsController < ApplicationController
	def index
	end

	def new
	end

	#to save posts we need to create a create posts
	def create
		@post = Post.new(post_params)
		#Note: rails 4 requires you to explicitly say what parameters you are going to allow
		@post.save

		redirect_to @post
	end

	#we are defining @post
	def show
		@post = Post.find(params[:id])
	end

	private
		def post_params
			params.require(:post).permit(:title, :body)
		end
end
