class MomentsController < ApplicationController


 before_action :authenticate_user!, :only => [:new, :create, :moments]


	def index

		@moments = Moment.all

	end

	def about

	end

	def how_it_works

	end

	def moments

		@moments = Moment.all.order("created_at DESC")

	end

	def show

		@moment = Moment.find(params[:id])

	end


	def new

		@moments = Moment.new

	end

	def create

		@moments = Moment.new(safe_moment_params)
		
		if @moments.save

			redirect_to moments_path

		else 

			render 'new'

		end

	end


	def edit									# Edits a shirt

		@moments = Moment.find(params[:id])


	end


	def update

		@moments = Moment.find(params[:id])

		@moments.update(safe_moment_params)    # Saves the object so you don't have to call @shirt.save

		redirect_to moments_path(@moments)

	end

	def destroy

		@moments = Moment.find(params[:id])	# Destroys a shirt

		@moments.destroy

		redirect_to root_path

	end


	private

	def safe_moment_params

		return params.require(:moment).permit(:title, :image, :blog, :song)

	end


end
