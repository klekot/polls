class AdminController < ApplicationController
  before_filter :authenticate_user!

  def index
    @users = User.all
    redirect_to root_path unless current_user.admin
  end
end
