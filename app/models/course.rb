# == Schema Information
#
# Table name: courses
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  start_date :date
#  available  :boolean
#  program    :text
#  note       :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  city       :string(255)
#  price      :float
#  type       :string(255)
#

class Course < ActiveRecord::Base
  attr_accessible :available, :name, :note, :program, :start_date

  attr_accessor :name_with_date

  has_many :orders

  def name_with_date
    "#{name}, #{city} - #{I18n.localize(start_date)}"
  end
end
