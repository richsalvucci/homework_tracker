class UserMailer < ActionMailer::Base
  default from: "from@example.com"

  def new_user_email(user)
    puts user.inspect
    @user = user
    mail(to: user.email, subject: "Welcome to the Iron Yard")
  end
  def new_comment_email_admin(admin)
    puts user.ispect
    @user = user
    mail(to: )
    
  end
end
