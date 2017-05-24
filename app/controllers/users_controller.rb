class UsersController < ApplicationController

  def show
    @user = current_user
  end

  def requests
    @requests = current_user.requests
  end
end
