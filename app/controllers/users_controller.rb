class UsersController < ApplicationController

  before_filter :get_courses,           only: [:new, :create]
  before_filter :check_authentication,  only: [:complete_registration, :profile]

  # GET /registrace
  def new
    @user = User.new
  end

  # POST /users
  def create
    @user = User.new(user_params)

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

  # GET /registrace/doplneni
  def complete_registration
    @user = current_user
  end

  # PUT /users
  def update
    @user = User.find(params[:id])

    respond_to do |format|
      if @user.update_attributes(user_params)
        if session[:return_to].present?
          format.html { redirect_to session[:return_to], notice: 'Údaje úspěšně uloženy' }
        else
          format.html { redirect_to root_path, notice: 'Údaje úspěšně uloženy' }
        end
      else
        format.html { render 'complete_registration' }
      end
    end
  end

  # GET /profil
  def profile
    @user = User.find(current_user)
  end

  private

  def get_courses
    @courses = Course.find(:all, conditions: { available: true })
  end

  def user_params
    params.require(:user).permit(:email, :name, :password_hash,
                                 :password_salt, :surname, :password, :password_confirmation, :street, :city,
                                 :postal_code, :date_of_birth, :place_of_birth, :billing_street, :billing_city,
                                 :company, :billing_postal_code, :company, :ic, :dic, :course_interest, :form
                                )
  end
end
