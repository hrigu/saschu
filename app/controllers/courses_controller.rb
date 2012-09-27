# -*- encoding : utf-8 -*-

class CoursesController < ApplicationController

  #can_can
  load_and_authorize_resource except: [:choose, :mychoose]  #cancan

  # GET /courses
  def index
  end

  # GET /courses/1
  def show
  end

  def my
    unless current_user.rolable.course
      redirect_to new_course_path
    else
      redirect_to course_path(current_user.rolable.course)
    end
  end

  # GET /courses/new
  def new
#    @course = Course.new
  end

  # GET /courses/1/edit
  def edit
#    @course = Course.find(params[:id])
  end

  # POST /courses
  def create
    @course = Course.new(params[:course])
    @course.parent = current_user.rolable
    if @course.save
      redirect_to @course, notice: 'Kurs wurde erstellt. Danke!.'
    else
      render action: "new"
    end
  end

# PUT /courses/1
  def update
    @course = Course.find(params[:id])
    if @course.update_attributes(params[:course])
      redirect_to @course, notice: 'Kurs wurde aktualisiert'
    else
      render action: "edit"
    end
  end

# DELETE /courses/1
  def destroy
    @course = Course.find(params[:id])
    @course.destroy
    redirect_to courses_url
  end

  def choose
    authorize! :choose, Course

    student = current_user.rolable
    if student.definitive_course
      @choosen_course = student.definitive_course
      render :show_definitive_course
    else
      @choosen_courses = student.choosen_courses
      unless @choosen_courses.empty?
        render :show_choosen_courses
      else
        @courses = Course.find_for_student student
      end

    end
  end



  def mychoose
    authorize! :mychoose, Course

    first = params[:first]
    second = params[:second]
    third = params[:third]

    if first.present?
      course = Course.find(first.to_i)
      cc = ChoosenCourse.new({priority: 1})
      cc.course = course
      cc.student = current_user.rolable
      cc.save
    end
    if second.present?
      course = Course.find(second.to_i)
      cc = ChoosenCourse.new({priority: 2})
      cc.course = course
      cc.student = current_user.rolable
      cc.save
    end
    if third.present?
      course = Course.find(third.to_i)
      cc = ChoosenCourse.new({priority: 3})
      cc.course = course
      cc.student = current_user.rolable
      cc.save
    end
    redirect_to choose_courses_path, notice: 'Kurse wurden gewählt'

  end
end
