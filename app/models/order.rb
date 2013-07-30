# == Schema Information
#
# Table name: orders
#
#  id              :integer          not null, primary key
#  user_id         :integer
#  course_id       :integer
#  variable_symbol :string(255)
#  paid            :boolean
#  paid_at         :datetime
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

class Order < ActiveRecord::Base

  default_scope { order('created_at DESC') }

  belongs_to :user
  belongs_to :course

  after_create :generate_variable_symbol!

  def paid?
    paid
  end

  # Set order as payed and update paid_at time
  def pay!
    self.paid = true
    self.paid_at = DateTime.now
    self.save
  end

  def to_s
    self.variable_symbol
  end

  def due_pay
    if self.course.start_date - 7.days >= DateTime.now
      self.course.start_date - 7.days
    else
      self.course.start_date - 3.days
    end
  end

  private

  def generate_variable_symbol!
    vs = "%08d" % self.id
    self.variable_symbol = vs
    self.save
  end

end
