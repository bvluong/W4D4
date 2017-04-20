class SessionsController < ApplicationController
  def new
    render :new
  end

  def create
    @user = User.find_by_credentials(
      params[:user][:email],
      params[:user][:password]
    )

    if @user
      log_in_user!(@user)
      redirect_to user_url(@user)
    else
      flash[:errors] = "Invalid credentials"
      redirect_to new_sessions_url
    end
  end

  def destroy
    if logged_in?
      log_out_user!
    end
    render :new
  end

end
