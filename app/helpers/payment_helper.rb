module PaymentHelper
  def can_buy?
    tmp = BoughtList.find_by(course_id: @course.id, user_id: current_user.id)
    unless tmp.present?
      true
    end
  end
end
