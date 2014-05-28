class SessionsController < ApplicationController
  # GET /prihlasit
  def new
  end

  # POST /prihlasit
  def create
    user = User.authenticate(params[:email], params[:password])
    if user
      if user.confirmed?
        if params[:remember_me]
          cookies[:remember_me_id]   = { value: user.id.to_s,           expires: 30.days.from_now }
          cookies[:remember_me_code] = { value: user.remember_me_code,  expires: 30.days.from_now }
        end
        session[:user_id] = user.id

        if session[:return_to].present?
          redirect_to session[:return_to], notice: 'Uživatel úspěšně přihlášen'
        else
          redirect_to root_path, notice: 'Uživatel úspěšně přihlášen'
        end
      else
        flash.now.alert = "Uživatelský účet nebyl dosud aktivován! Zkontrolujte svojí emailovou adresu zadanou při registraci (#{user.email}) na kterou Vám byl odeslán aktivační email a řiďte se pokyny obsaženými v emailu. <a href=\"/registrace/#{user.id}/znovu-poslat-potvrzeni\">Poslat znovu aktivační email</a>".html_safe
        render "new"
      end
    else
      flash.now.alert = 'Nesprávný email nebo heslo!'
      render 'new'
    end
  end

  # GET /odhlasit
  def destroy
    session[:user_id] = nil
    cookies.delete :remember_me_id   if cookies[:remember_me_id]
    cookies.delete :remember_me_code if cookies[:remember_me_code]

    if session[:return_to].present?
      redirect_to session[:return_to], notice: 'Uživatel úspěšně odhlášen'
    else
      redirect_to root_path, notice: 'Uživatel úspěšně odhlášen'
    end
  end
end
