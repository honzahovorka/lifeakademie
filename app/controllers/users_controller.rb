class UsersController < ApplicationController
  before_filter :get_courses, only: [:new, :create]
  # GET /registrace
  def new
    @user = User.new
  end

  # POST /users
  def create
    @user = User.new(params[:user])

    respond_to do |format|
      if @user.save
        UserMailer.confirm(@user, request.host).deliver
        format.html { redirect_to root_path, :notice => "Uživatel úspěšně zaregistrován. Na email <b>#{@user.email}</b> Vám byly zaslány instrukce pro dokončení registrace.".html_safe }
      else
        format.html { render 'new' }
      end
    end
  end

  # GET /registrace/:user_id/dokoncit/:hash
  def confirm
    @user = User.find(params[:user_id])
    if @user.email_confirmation_hash == params[:hash]
      @user.confirm_email!
      redirect_to root_path, notice: "Registrace byla úspěšně dokončena. Nyní se můžete <a href=\"/prihlasit\">přihlásit</a>.".html_safe
    else
      redirect_to root_path, alert: "Aktivace se nezdařila!"
    end
  end

  private

  def get_courses
    @courses = Course.find(:all, conditions: { available: true })
  end
end
