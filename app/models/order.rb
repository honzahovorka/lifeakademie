# == Schema Information
#
# Table name: orders
#
#  id              :integer          not null, primary key
#  user_id         :integer
#  course_id       :integer
#  variable_symbol :string(255)
#  paid            :boolean          default(FALSE)
#  paid_at         :datetime
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  status          :string(255)
#  price           :float
#

class Order < ActiveRecord::Base

  default_scope { order('created_at DESC') }
  scope :unpaid, -> { where('paid = ? AND (status != ? OR status IS NULL)', false, 'storno') }
  scope :paid, -> { where(paid: true) }

  belongs_to :user, touch: true
  belongs_to :course, touch: true

  after_create :generate_variable_symbol!
  after_create :set_price!

  def paid?
    paid
  end

  # Set order as payed and update paid_at time
  def pay!
    update_attributes paid: true, paid_at: DateTime.now
  end

  def to_s
    variable_symbol
  end

  def due_pay
    if course.start_date - 7.days >= DateTime.now
      course.start_date - 7.days
    else
      course.start_date - 3.days
    end
  end

  def storno!(user)
    if user != self.user && !user.editor?
      return false
    end

    update_attribute(:status, 'storno')
  end

  def storno?
    status == 'storno'
  end

  private

  def generate_variable_symbol!
    vs = "%07d" % id
    update_attribute(:variable_symbol, "77#{vs}")
  end

  def set_price!
    update_attribute(:price, course.price)
  end
end
