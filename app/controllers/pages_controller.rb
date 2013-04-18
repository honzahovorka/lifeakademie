class PagesController < ApplicationController
  def main
  end

  def courses
    if params[:subpage] == 'profil-absolventa'
      render 'pages/courses/profile'
    elsif params[:subpage] == 'ucebni-plan'
      render 'pages/courses/course-plan'
    elsif params[:subpage] == 'metody-vyuky'
      render 'pages/courses/methods'
    elsif params[:subpage] == 'osvedceni'
      render 'pages/courses/certificate'
    end
  end
end
