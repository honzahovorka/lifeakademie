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
    elsif params[:subpage] == 'smluvni-podminky'
      render 'pages/courses/terms'
    elsif params[:subpage] == 'lektori'
      render 'pages/courses/lectors'
    end
  end

  def contact
    @contact_message = ContactMessage.new
  end

end
