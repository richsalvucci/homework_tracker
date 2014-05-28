class HomeworksController < ApplicationController
  before_action :authenticate_user!
  before_filter :find_homework, only: [:show, :edit, :update, :destroy, :comment, :add_comment]
  def index
    # authorize! :read, Homework
    @homeworks = Homework.all.accessible_by(current_ability, :read)

  end

  def new
    # authorize! :create, Homework
    @homework = Homework.new
    @courses = Course.all
    @locations = Location.all
  end

  def create
    # authorize! :create, Homework
    @homework = Homework.create homework_params.merge(user_id: current_user.id)
    if @homework.save
      flash[:notice] = "Thank You"
     redirect_to root_path
    else
      flash[:error] = "Please name your homework."
      render :new
    end
  end

  def show
    # authorize! :read, Homework
    @submissions = Submission.all
    @comment = @homework.comments.all
  end

  def edit
    # authorize! :update, Homework
   @courses = Course.all 
  end

  def update
    # authorize! :update, Homework
    @homework.update_attributes homework_params
    redirect_to root_path
  end

  def destroy
    # authorize! :destroy, Homework
    @homework.delete
    redirect_to root_path
  end

  def comment
    # authorize! :create, Comment
    @comment = @homework.comments.new
  end

  def add_comment
    # authorize! :create, Comment 
    @comment = @homework.comments.create comment_params
    @comment = @homework.comments.all
    respond_to do |format|
      format.js
    end
  end
private
  def find_homework
    @homework = Homework.find params[:id]
  end
  
  def homework_params
    params.require(:homework).permit(:description, :name, :course_id, :user_id)
  end

  def comment_params
    params.require(:comment).permit(:comment)
  end
end
