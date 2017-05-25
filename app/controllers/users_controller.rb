class UsersController < ApplicationController

  def show
    @user = current_user
  end

  def requests
    @requests = current_user.requests
  end

  def profile_edit
    @user = current_user
  end

  def profile_update
    @user = current_user
    if @user.update(user_params)
      redirect_to user_path(@user), notice: 'Your profile was successfully updated.'
    else
      render :profile_edit
    end
  end

  private

    def user_params
      params.require(:user).permit(:first_name, :last_name, :sexe, :picture)
    end
end
