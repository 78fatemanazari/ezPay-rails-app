class UsersController < ApplicationController
  before_action :authenticate_user!

  def show
    @user = current_user
  end

  def update_avatar
    @user = current_user
    @user.avatar.attach(params[:user][:avatar]) if params[:user][:avatar].present?
    redirect_to @user, notice: 'Profile picture updated successfully.'
  end
end
