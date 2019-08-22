module LessonsHelper
  def can_watch?(lesson)
    tmp = WatchedList.find_by(course_id: @course.id, user_id: current_user.id, lesson_id: lesson.id)
    if tmp.present? and tmp.watch == true
      true
    end
  end
end
