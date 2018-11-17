class SessionsController < ApplicationController 
  def new

  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user  && user.authenticate(params[:session][:password])
      session[:user_id] = user.id
      flash[:success] = "Login Success. Welcome #{User.find_by_email(params[:session][:email].downcase).username}"
      redirect_to root_path
    else
      flash.now[:danger] = "Invalid email/password"
      render 'new'
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:success] = "You have logged out"
    redirect_to root_path
  end
end