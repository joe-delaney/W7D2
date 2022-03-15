class UsersController < ApplicationController
  def new 
    render :new
  end

  def create 
    @user = User.new(user_params)

    if @user.save
      log_in_user!(@user)
      redirect_to users_url
    else
      flash.now[:errors] << @user.errors.full_messages
      render :new
    end
  end
end