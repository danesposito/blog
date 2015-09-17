class PostsController < ApplicationController
	def index
		#This will show all posts in descending order
		@posts = Post.all.order('created_at DESC')
	end

	def new
		@post = Post.new
	end

	#to save posts we need to create a create posts
	def create
		@post = Post.new(post_params)
		#Note: rails 4 requires you to explicitly say what parameters you are going to allow
		if @post.save
			redirect_to @post
		else
			#render prevents using redirect so you don't lose what is being validated
			render 'new'
		end
	end

	#we are defining @post
	def show
		@post = Post.find(params[:id])
	end

	def edit
		#post from the ide
		@post = Post.find(params[:id])
	end

	def update
		#find the post by id
		@post = Post.find(params[:id])

		#if  permit the title and body
		if @post.update(params[:post].permit(:title, :body))
			redirect_to	@post
		else
			render 'edit'
		end

	end

	def destroy
		@post = Post.find(params[:id])
		@post.destroy

		redirect_to root_path
	end

	private
		def post_params
			params.require(:post).permit(:title, :body)
		end
end
