class Course < ActiveRecord::Base
  attr_accessible :available, :name, :note, :program, :start_date

  attr_accessor :name_with_date

  def name_with_date
    "#{name} #{I18n.localize(start_date)}"
  end
end
