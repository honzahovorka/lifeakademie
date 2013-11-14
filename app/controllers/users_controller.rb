class UsersController < ApplicationController
  layout 'admin', only: [:index, :show]

  before_filter :get_courses,               only: [:new, :create]
  before_filter :check_authentication,      only: [:complete_registration, :profile]
  before_filter :check_editor_privileges,   only: [:index, :show, :destroy]

  # GET /admin/uzivatele
  def index
    @users = User.users
    @editors = User.editors
  end

  # GET /admin/uzivatel/:id
  def show
    @user = User.find params[:id]
  end

  # DELETE /admin/uzivatel/:id
  def destroy
    user = User.find params[:id]
    user.destroy

    redirect_to admin_users_path, notice: "Uživatel úspěšně odstraněn"
  end

  # GET /registrace
  def new
    @user = User.new
  end

  # POST /users
  def create
    @user = User.new user_params

    respond_to do |format|
      if @user.save
        UserMailer.confirm(@user, request.host).deliver
        format.html { redirect_to root_path, :notice => "Uživatel úspěšně zaregistrován. Na email <b>#{@user.email}</b> Vám byly zaslány instrukce pro dokončení registrace.".html_safe }
      else
        format.html { render 'new' }
      end
    end
  end

  def resend_confirmation
    @user = User.find params[:user_id]
    if @user
      @user.generate_confirmation_hash!
      UserMailer.confirm(@user, request.host).deliver
      redirect_to root_path, :notice => "Uživatel úspěšně zaregistrován. Na email <b>#{@user.email}</b> Vám byly zaslány instrukce pro dokončení registrace.".html_safe
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

  # GET /profil/upravit
  def edit
    @user = current_user
  end

  # PUT /users
  def update
    @user = User.find params[:id]

    respond_to do |format|
      if @user.update_attributes user_params
        if request.referer.include?('profil/upravit')
          format.html { redirect_to profile_path, notice: 'Údaje úspěšně uloženy' }
        elsif session[:return_to].present?
          format.html { redirect_to session[:return_to], notice: 'Údaje úspěšně uloženy' }
        else
          format.html { redirect_to root_path, notice: 'Údaje úspěšně uloženy' }
        end
      else
        if request.referer.include?('reset-hesla')
          format.html { render 'change_password' }
        elsif request.referer.include?('profil/upravit')
          format.html { render 'edit' }
        else
          format.html { render 'complete_registration' }
        end
      end
    end
  end

  # GET /profil
  def profile
    @user = User.find(current_user)
  end

  ##### PASSWORD RESET

  # GET /registrace/reset-hesla
  def password_reset_request
  end

  # POST /registrace/reset-hesla
  def password_reset
    if params[:email].empty?
      redirect_to request_password_reset_path, :alert => 'Musíte vyplnit e-mail'
      return
    end

    @user = User.find_by_email params[:email]
    if @user
      if @user.confirmed?
        @user.reset_password!
        UserMailer.password_reset(@user, request.host).deliver
        redirect_to root_path, notice: "Reset hesla proběhl úspěšně! Na Váš email (#{@user.email}) byly odeslány instrukce pro nastavení nového hesla."
      else
        redirect_to login_path, alert: "Uživatelský účet nebyl dosud aktivován! Zkontrolujte svojí emailovou adresu zadanou při registraci (#{@user.email}) na kterou Vám byl odeslán aktivační email a řiďte se pokyny obsaženými v emailu. <a href=\"/registrace/#{@user.id}/znovu-poslat-potvrzeni\">Poslat znovu aktivační email</a>".html_safe
      end
    else
      redirect_to request_password_reset_path, alert: 'Uživatel s Vámi zadanou emailovou adresou neexistuje'
    end
  end

  # GET /registrace/reset-hesla/:id/:hash
  def change_password
    @user = User.find params[:id]

    if ! (@user.password_reset_hash == params[:hash] and @user.password_reseted_at + 1.day >= DateTime.now)
      redirect_to request_password_reset_path, alert: 'Platnost požadavku na změnu hesla vypršela. Zažádejte o změnu hesla znovu.'
    end
  end

  private

  def get_courses
    @courses = Course.available
  end

  def user_params
    params.require(:user).permit(:email, :name, :password_hash, :password_salt, :surname, :password, :password_confirmation, :street, :city, :postal_code, :date_of_birth, :place_of_birth, :billing_street, :billing_city, :company, :billing_postal_code, :company, :ic, :dic, :course_interest, :form, :phone)
  end
end
