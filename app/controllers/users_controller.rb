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
    @roles = User.assignable_roles
  end

  def update
    # @user = 
  end

  def destroy
  end

  private

  def user_params
    params.require(:user).permit(:name, :role)
  end
end
