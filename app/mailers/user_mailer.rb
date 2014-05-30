class UserMailer < ActionMailer::Base
  default from: "from@example.com"

  def new_user_email(user)
    @user = user
    mail(to: user.email, subject: "Welcome to the Iron Yard")
  end

  def new_comment_email(comment)
    @comment = comment
    @user_comment = comment.commentable
    @user = @user_comment.comments.map(&:user)
   
    mail(to: @user.map(&:email).uniq, subject: "A comment was added") 
  end
end
