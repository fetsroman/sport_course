module CoursesHelper
  def can_download?
    tmp = BoughtList.find_by(course_id: @course.id, user_id: current_user.id)
    if tmp.present? and tmp.tariff == 'advanced'
      true
    end
  end

  def can_contact?
    tmp = BoughtList.find_by(course_id: @course.id, user_id: current_user.id)
    if tmp.present? and tmp.tariff == 'vip'
      true
    end
  end
end
