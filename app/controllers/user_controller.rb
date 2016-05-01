class UserController < ApplicationController
  skip_before_filter :verify_authenticity_token

  def signin
  end

  def login
    @user = User.where(username: user_params['username']).first_or_create
    if @user
      redirect_to "/user/#{@user.id}/index"
    else
      render :signin
    end
  end

  private

  # white list params
    def user_params
      params.permit(:username)
    end
end
