class SubmissionsController < ApplicationController
  before_action :authenticate_user!
  before_filter :find_submission, only: [:show, :edit, :update, :destroy, :new_homework, :reviewing, :complete, :incomplete, :comment, :add_comment]

  def index
    # authorize! :read, Submission
    @homeworks = Homework.all
    @submissions = Submission.all.accessible_by(current_ability, :read)
  end

  def new
    # authorize! :create, Submission
    @submission = Submission.new
    @locations = Location.all
    @homeworks = Homework.all
  end

  def create
    # authorize! :create, Submission
    @submission = Submission.create submission_params.merge(user_id: current_user.id)
    if @submission.save
      flash[:notice] = "Thank You"
     redirect_to root_path
    else
      flash[:error] = "Please name your submission."
      render :new
    end
  end

  def show
    # authorize! :read, Submission
    @comment = @submission.comments.all
  end

  def edit
    # authorize! :update, Submission
  end

  def update
    # authorize! :update, Submission
    @submission.update_attributes submission_params
    redirect_to root_path
  end

  def destroy
    # authorize! :destroy, Submission
    @submission.delete
    redirect_to root_path
  end

  def reviewing
    # authorize! :read, Submission
    @submission.reviewing!
    respond_to do |format|
      format.js
    end
  end 

  def incomplete
    # authorize! :read, Submission
    @submission.incomplete!
    respond_to do |format|
      format.js
    end
  end 

  def complete
    # authorize! :read, Submission
    @submission.complete!
    respond_to do |format|
      format.js
    end
  end 

  def finished
    # authorize! :read, Submission
  end

  def comment
    # authorize! :create, Comment
    @comment = @submission.comments.new
  end

  def add_comment
    # authorize! :create, Comment 
    @comment = @submission.comments.create comment_params
    @comment = @submission.comments.all
    respond_to do |format|
      format.js
    end
  end
private
  def find_submission
    @submission = Submission.find params[:id]
  end
  
  def submission_params
    params.require(:submission).permit(:description, :workflow_state, :homework_id, :user_id, links_attributes: [:link,:submission_id, :_destroy])
  end

  def comment_params
    params.require(:comment).permit(:comment)
  end
end
