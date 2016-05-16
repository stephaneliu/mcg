class UsersController < ApplicationController
  before_action :authenticate_user!

  def index
    @users = User.assignables
    @roles = User.assignable_roles
  end

  def show
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
  end

  def destroy
  end
end
