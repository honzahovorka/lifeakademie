module CoursesHelper
  def user_ordered_course?(user_id, course_id)
    User.find(user_id).orders.find(:all, conditions: { course_id: course_id}).count > 0
  end
end
