class LessonsController < ApplicationController
  before_action :authenticate_user!
  load_and_authorize_resource
  before_action :set_course#, only: [:new, :create, :edit, :update]
  before_action :set_lesson, only: [:show, :edit, :update, :destroy]
  before_action :can_watch?, only: [:show]

  # GET /lessons
  # GET /lessons.json
  def index
    @watched_list = WatchedList.find_by(course_id: @course.id, watched: false, watch: true, user_id: current_user.id)

    if @watched_list.present?
      @lesson = Lesson.where(id: @watched_list.lesson_id).last
    else
      @watched_list = WatchedList.where(course_id: @course.id, watched: true, watch: true, user_id: current_user.id).last
      @lesson = Lesson.where(id: @watched_list.lesson_id).last
    end
  end

  # GET /lessons/1
  # GET /lessons/1.json
  def show
    respond_to do |format|
      format.html { render @lesson }
      format.js
    end
  end
  #
  # # GET /lessons/new
  # def new
  #   @lesson = Lesson.new
  # end
  #
  # # GET /lessons/1/edit
  # def edit
  # end
  #
  # # POST /lessons
  # # POST /lessons.json
  # def create
  #   @lesson = @course.lessons.build(lesson_params)
  #
  #   respond_to do |format|
  #     if @lesson.save
  #       format.html { redirect_to @course, notice: 'Lesson was successfully created.' }
  #       format.json { render :show, status: :created, location: @lesson }
  #     else
  #       format.html { render :new }
  #       format.json { render json: @lesson.errors, status: :unprocessable_entity }
  #     end
  #   end
  # end
  #
  # # PATCH/PUT /lessons/1
  # # PATCH/PUT /lessons/1.json
  # def update
  #   respond_to do |format|
  #     if @lesson.update(lesson_params)
  #       format.html { redirect_to @course, notice: 'Lesson was successfully updated.' }
  #       format.json { render :show, status: :ok, location: @lesson }
  #     else
  #       format.html { render :edit }
  #       format.json { render json: @lesson.errors, status: :unprocessable_entity }
  #     end
  #   end
  # end
  #
  # # DELETE /lessons/1
  # # DELETE /lessons/1.json
  # def destroy
  #   @lesson.destroy
  #   respond_to do |format|
  #     format.html { redirect_to @course, notice: 'Lesson was successfully destroyed.' }
  #     format.json { head :no_content }
  #   end
  # end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_lesson
      @lesson = @course.lessons.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    # def lesson_params
    #   params.require(:lesson).permit(:title, :description, :image, :video)
    # end

    def set_course
      @course = Course.find(params[:course_id])
    end

    def can_watch?
      tmp = WatchedList.find_by(course_id: @course.id, user_id: current_user.id, lesson_id: @lesson.id)
      unless tmp.present? and tmp.watch == true
        redirect_to root_path
      end
    end
end
