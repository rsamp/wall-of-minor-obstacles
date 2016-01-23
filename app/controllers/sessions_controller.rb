class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by_credentials(params[:user][:username], params[:user][:password])
    if user
      login_user(user)
      redirect_to list_index_url
    else
      flash.now[:errors] = ["Username/Password combination is incorrect"]
      redirect_to new_session_url
    end
  end

  def destroy
    logout_user
    redirect_to new_session_url
  end

end