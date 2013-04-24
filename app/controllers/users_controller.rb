class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(params[:user])

    respond_to do |format|
      if @user.save
        format.html { redirect_to root_path, :notice => 'Uživatel úspěšně zaregistrován' }
      else
        format.html { render 'new' }
      end
    end
  end
end