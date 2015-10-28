class UsersController < ApplicationController
  before_filter :authenticate_user!

  def index
    @q = User.search(params[:q])
    @users = @q.result
  end

  def show
    @user = User.find(params[:id])
  end
end
