class Course < ActiveRecord::Base
  attr_accessible :available, :name, :note, :program, :start_date
end
