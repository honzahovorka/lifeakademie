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

require 'spec_helper'

describe Course do
  pending "add some examples to (or delete) #{__FILE__}"
end
