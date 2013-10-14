module CoursesHelper
  def user_ordered_course?(user_id, course_id)
    !User.find(user_id).orders.where(course_id: course_id).empty?
  end
end
