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
  attr_accessible :paid, :paid_at, :variable_symbol
end
