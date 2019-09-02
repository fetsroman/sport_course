class WatchedListsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_course
  before_action :set_lesson

  def watched
    @watched_list = WatchedList.find_by(lesson_id: @lesson.id, user_id: current_user.id, course_id: @course.id)
    @watched_list.update(watched: true)
    @id = @lesson.id + 1
    @watched_list = WatchedList.find_by(lesson_id: @id, user_id: current_user.id, course_id: @course.id)
    if @watched_list.present?
      @watched_list.update(watch: true)
    end
  end

  private

  def set_course
    @course = Course.find(params[:course_id])
  end

  def set_lesson
    @lesson = Lesson.find(params[:lesson_id])
  end
end
