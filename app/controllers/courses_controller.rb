class CoursesController < ApplicationController
  def index
    @courses = Course.all
  end

  def reserve
    
  end
end
