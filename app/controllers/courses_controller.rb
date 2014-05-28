class CoursesController < ApplicationController
  before_action :authenticate_user!
  before_filter :find_course, only: [:show, :edit, :update, :destroy]

  def index
    authorize! :read, Course
    @courses = Course.all.accessible_by(current_ability, :read)
  end

  def new
    authorize! :create, Course
    @course = Course.new
    @locations = Location.all
  end

  def create
    authorize! :create, Course
    @course = Course.create course_params
    if @course.save
      flash[:notice] = "Thank You"
     redirect_to root_path
    else
      flash[:error] = "Please name your course."
      render :new
    end
  end

  def show
    authorize! :read, Course
  end

  def edit
    authorize! :update, Course
    @locations = Location.all
  end

  def update
    authorize! :update, Course
    @course.update_attributes course_params
    redirect_to root_path
  end

  def destroy
    authorize! :destroy, Course
    @course.delete
    redirect_to root_path
  end
private
  def find_course
    @course = Course.find params[:id]
  end
  
  def course_params
    params.require(:course).permit(:name, :location_id)
  end
end

