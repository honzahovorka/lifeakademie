class CoursesController < ApplicationController

  before_filter :check_authentication, only: [:reserve]

  # GET /terminy(/:location)
  def index
    @courses = Course.all
  end

  # GET /terminy/:id/prihlaseni
  def reserve
    @course = Course.find(params[:id])
    if ! current_user.is_eligible?
      redirect_to complete_registration_path, alert: 'Musíte doplnit všechny údaje potřebné k přihlášení do kurzu.'
      return
    end
  end
end
