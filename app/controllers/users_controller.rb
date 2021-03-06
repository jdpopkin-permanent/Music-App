class UsersController < ApplicationController
  def new
    @user = User.new
    render :new
  end

  def create
    @user = User.new(params[:user])
    @user.set_statuses

    if @user.save
      msg = UserMailer.welcome_email(@user, user_activate_url(@user))
      msg.deliver!
      # flash message?
      self.current_user = @user
      redirect_to bands_url
    else
      # flash
      redirect_to :back
    end
  end

  def activate
    @user = User.find(params[:user_id])
    if @user.session_token == session[:session_token]
      @user.active = true
    end
    @user.save
    redirect_to bands_url
  end
end
