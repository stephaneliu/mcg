class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  def index
    authorize User
    @users = User.assignables
    @roles = User.assignable_roles
  end

  def edit
    respond_to do |format|
      format.js do
        @roles = User.assignable_roles
      end
    end
  end

  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.js   { flash.now[:notice] = 'User was successfully updated.' }
      else
        format.js { flash.now[:error] = 'User could not be updated.' }
      end
    end
  end

  def destroy
  end

  private

  def set_user
    @user = User.find(params[:id])
    authorize @user
  end

  def user_params
    params.require(:user).permit(:name, :role)
  end
end
