class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    byebug
  end

  def destroy
  end
end
