class UsersController < ApplicationController

  before_action :require_logged_out, only: [:new, :create]
  before_action :require_logged_in, only: [:show]

  def new 
    render :new
  end

  def create 
    @user = User.new(user_params)

    if @user.save
      log_in_user!(@user)
      redirect_to user_url(@user)
    else
      flash.now[:errors] << @user.errors.full_messages
      render :new
    end
  end
end