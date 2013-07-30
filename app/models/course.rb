# == Schema Information
#
# Table name: courses
#
#  id          :integer          not null, primary key
#  name        :string(255)
#  start_date  :date
#  available   :boolean
#  program     :text
#  note        :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  city        :string(255)
#  price       :float
#  course_type :string(255)
#

class Course < ActiveRecord::Base

  scope :upcoming, lambda { where('start_date > ?', 1.day.ago).limit(5) }
  scope :available, -> { where('available', true) }

  # attr_accessible :available, :name, :note, :program, :start_date, :price, :city

  attr_accessor :name_with_date

  validates_presence_of :name, :start_date, :price, :city

  has_many :orders

  def name_with_date
    "#{city}, zahájení od #{I18n.localize(start_date)}"
  end
end
