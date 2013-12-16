class MomentsController < ApplicationController


 before_action :authenticate_user!, :only => [:new, :create, :moments, :image]


	def index

		@moments = Moment.all

	end

	def about

	end

	def how_it_works

	end

	def moments

		@moments = Moment.all.order("created_at DESC")

		@client = Soundcloud.new(:client_id => '8e38e03320f1b0cdde7d69fe832142c9')

		# get a tracks oembed data
		
	end

	def show

		@moment = Moment.find(params[:id])
		@comment = Comment.new
		@client = Soundcloud.new(:client_id => '8e38e03320f1b0cdde7d69fe832142c9')


	end


	def new

		@moment = Moment.new

	end

	def create

		@moment = Moment.new(safe_moment_params)

		@moment.user = current_user
		
		if @moment.save

			redirect_to moments_path

		else 

			render :new

		end

	end


	def edit									# Edits a shirt

		@moment = Moment.find(params[:id])

	end


	def update

		@moment = Moment.find(params[:id])

		@moment.update(safe_moment_params)    # Saves the object so you don't have to call @shirt.save

		redirect_to moments_path(@moment)

	end

	def destroy

		@moment = Moment.find(params[:id])	# Destroys a shirt

		@comments = @moment.comments.all

		@comments.each do |comment|

			comment.destroy
		end

		@moment.destroy

		# Get all the comments for that specific moment and destroy them all

		redirect_to moments_path

	end


	private

	def safe_moment_params

		return params.require(:moment).permit(:title, :image, :blog, :song)

	end


end
