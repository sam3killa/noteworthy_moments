class UserMailer < ActionMailer::Base
  default from: "samuels.shih@gmail.com"

  def welcome_email( user )
  	@user = user
  	mail( :to => user.email, :subject => "Thanks for signing up for Noteworthy Moments!")
  end

end
