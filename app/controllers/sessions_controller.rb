class SessionsController < ApplicationController
  def create
    user = User.find_by_credentials(params[:user][:username],
      params[:user][:password])

    if user.nil?
      #error
      redirect_to :back
    else
      self.current_user = user
      redirect_to bands_url
    end
  end

  def new
    render :new
  end

  def destroy
    end_session
    redirect_to bands_url
  end
end
