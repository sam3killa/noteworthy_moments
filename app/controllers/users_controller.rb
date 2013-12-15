class UsersController < ApplicationController


	def show

		@user = User.find(params[:id])
		@client = Soundcloud.new(:client_id => '8e38e03320f1b0cdde7d69fe832142c9')

	end


end
