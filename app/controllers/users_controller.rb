require 'set'

class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      login_user(@user)
      redirect_to root_url
    else
      flash.now[:errors] = @user.errors.full_messages
      render :new
    end
  end

  def destroy
    @user = User.find(params[:id])
    if @user.destroy
      redirect_to list_index_url
    else
      flash[:errors] = @user.errors.full_messages
      redirect_to list_index_url
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to list_index_url
    else
      flash[:errors] = @user.errors.full_messages
      redirect_to list_index_url
    end
  end

  def add_r
    @user = User.find(params[:user_id])
    @user.increment!(:rejections)
    redirect_to list_index_url
  end

  def remove_r
    @user = User.find(params[:user_id])
    @user.decrement!(:rejections)
    redirect_to list_index_url
  end

  def all_cohorts
    @users = User.all()
    @cohorts = Set.new
    @users.each do |user|
      @cohorts.add(user.startdate)
    end
    @cohorts
  end

  def toggle_done
    @user = User.find(params[:user_id])
    @user.update(done: !@user.done)
    redirect_to list_index_url
  end

  private

  def user_params
    params.require(:user).permit(:username, :display_name, :password, :password_confirmation, :color, :done)
  end

end
