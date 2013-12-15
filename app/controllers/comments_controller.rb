class CommentsController < ApplicationController

 before_action :authenticate_user!, :only => [:create]

	def create

		@moment = Moment.find(params[:moment_id])

		safe_comment = params.require(:comment).permit(:text)

		@comment = Comment.new(safe_comment)
		@comment.moment = @moment
		@comment.user = current_user
		@comment.save

		redirect_to @comment.moment

	end
	

	def destroy

		@moments = Comment.find(params[:moment_id])	# Destroys a shirt

		@moments.destroy

		redirect_to moments_path

	end

end
