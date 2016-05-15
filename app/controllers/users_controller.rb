class UsersController < ApplicationController
  before_action :authenticate_user!

  def index
    puts "###### got it"
    @users = User.all
  end

  def show
  end

  def edit
  end

  def update
  end

  def destroy
  end
end
