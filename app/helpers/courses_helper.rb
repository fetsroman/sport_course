module CoursesHelper
  def can_download?
    tmp = BoughtList.find_by(course_id: @course.id, user_id: current_user.id)
    rate = Rate.find_by_id(tmp.rate_id)
    if tmp.present? and rate.tariff == 'advanced' || tmp.present? and rate.tariff == 'vip'
      true
    end
  end

  def can_contact?
    tmp = BoughtList.find_by(course_id: @course.id, user_id: current_user.id)
    rate = Rate.find_by_id(tmp.rate_id)
    if tmp.present? and rate.tariff == 'vip'
      true
    end
  end
end
