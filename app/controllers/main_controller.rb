class MainController < ApplicationController

	def index

		@moments = Moment.all

	end

	def about

	end

	def how_it_works

	end

	def moments

		@moments = Moment.all

	end

	def show

		@moment = Moment.find( params[:id])

	end

end
