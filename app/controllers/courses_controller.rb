class CoursesController < ApplicationController

  before_filter :check_authentication, only: [:reserve, :confirmation]
  before_filter :check_eligibility, only: [:reserve, :confirmation]

  # GET /terminy(/:location)
  def index
    @courses = Course.all
  end

  # GET /terminy/:id/prihlaseni
  def reserve
    @course = Course.find(params[:id])
  end

  # GET /terminy/:id/prihlaseni/potvrzeni
  def finish_reservation
    @course = Course.find(params[:id])

    # move to view after confirmation
    @order = @course.orders.build
    @order.user = current_user
    @order.save

    redirect_to dates_path, notice: "Registrace byla úspěšně ukončena. Na Vaší emailovou adresu (#{current_user.email}) byl odeslán email s potvrzením."
  end

  private

  def check_eligibility
    redirect_to complete_registration_path, alert: 'Musíte doplnit všechny údaje potřebné k přihlášení do kurzu.' if ! current_user.is_eligible?
  end
end
