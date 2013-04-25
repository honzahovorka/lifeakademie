class SessionsController < ApplicationController
  # GET /prihlasit
  def new
  end

  # POST /prihlasit
  def create
    user = User.authenticate(params[:email], params[:password])
    if user and user.confirmed?
      if params[:remember_me]
        cookies[:remember_me_id] = { value: user.id.to_s, expires: 30.day.from_now }
        cookies[:remember_me_code] = { value: user.remember_me_code, expires: 30.days.from_now }
      end
      session[:user_id] = user.id

      redirect_to root_path, notice: 'Uživatel úspěšně přihlášen'
    else
      flash.now.alert = 'Nesprávný email nebo heslo!'
      render 'new'
    end
  end

  # GET /odhlasit
  def destroy
    session[:user_id] = nil
    cookies.delete :remember_me_id if cookies[:remember_me_id]

    redirect_to root_path, notice: 'Uživatel úspěšně odhlášen'
  end
end
