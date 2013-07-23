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
  belongs_to :user
  belongs_to :course
  # attr_accessible :paid, :paid_at, :variable_symbol

  after_create :generate_variable_symbol!

  def generate_variable_symbol!
    vs = "%08d" % self.id
    self.update_attribute(:variable_symbol, vs)
    self.save
  end

  def is_paid?
    paid
  end

  # Set order as payed and update paid_at time
  def pay!
    self.update_attribute(:paid, true)
    self.update_attribute(:paid_at, DateTime.now)
    self.save
  end
end
