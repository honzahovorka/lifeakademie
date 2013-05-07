class CoursesController < ApplicationController
  include CoursesHelper

  layout 'admin', only: [:new, :create, :list, :view, :update, :edit, :destroy]

  before_filter :check_authentication,      except: [:index, :show]
  before_filter :check_editor_privileges,   only:   [:new, :list, :view, :create, :update, :edit, :delete]
  before_filter :check_eligibility,         only:   [:reserve, :finish_reservation]
  before_filter :check_user_orders,         only:   [:reserve, :finish_reservation]


  # GET /admin/kurzy
  def list
    @courses = Course.all
  end

  # GET /admin/kurz/:id
  def view
    @course = Course.find(params[:id])
  end

  # GET /admin/kurz/pridat/novy
  def new
    @course = Course.new
  end

  # GET /admin/kurz/:id/upravit
  def edit
    @course = Course.find(params[:id])
  end

  # DELETE /admin/kurz/:id
  def destroy
    @course = Course.find(params[:id])
    @course.destroy

    respond_to do |format|
      format.html { redirect_to admin_courses_path, notice: 'Kurz úspěšně smazán' }
    end
  end

  # POST /kurzy
  def create
    @course = Course.new(params[:course])

    respond_to do |format|
      if @course.save
        format.html { redirect_to admin_courses_path, notice: 'Kurz úspěšně vytvořen' }
      else
        format.html { render 'new' }
      end
    end
  end

  # PUT /terminy/:id
  def update
    @course = Course.find(params[:id])

    respond_to do |format|
      if @course.update_attributes(params[:course])
        format.html { redirect_to admin_course_path(@course), notice: 'Kurz úspěšně upraven' }
      else
        format.html { render 'edit' }
      end
    end
  end

  # GET /terminy(/:location)
  def index
    @courses = Course.all
  end

  # GET /terminy/:id
  def show
    @course = Course.find(params[:id])
  end

  # GET /terminy/:id/prihlaseni
  def reserve
    @course = Course.find(params[:id])
  end

  # GET /terminy/:id/prihlaseni/potvrzeni
  def finish_reservation
    @course = Course.find(params[:id])

    @order = @course.orders.build
    @order.user = current_user

    if @order.save
      UserMailer.order(@order).deliver
      redirect_to dates_path, notice: "Registrace byla úspěšně ukončena. Na Vaší emailovou adresu (#{current_user.email}) byl odeslán email s potvrzením."
    else
      redirect_to course_reservation_path(@course), alert: "Registrace se nezdařila. Prosím, zopakujte registraci za chvíli."
    end
  end

  private

  def check_eligibility
    redirect_to complete_registration_path, alert: 'Musíte doplnit všechny údaje potřebné k přihlášení do kurzu.' unless current_user.is_eligible?
  end

  def check_user_orders
    redirect_to dates_path, alert: 'Na tento kurz již máte vytvořenou registraci.' if user_ordered_course?(current_user.id, params[:id])
  end

  def check_editor_privileges
    redirect_to login_path, alert: 'Nemáte dostatečné oprávnění pro vstup do administrace' unless current_user.is_editor?
  end
end
