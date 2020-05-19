class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by_email(params[:email])
    if user && user.authenticate(params[:password])
      if params[:remember_me]
        cookies.permanent[:remember_token] = user.remember_token
      else
        cookies[:remember_token] = user.remember_token
      end
      flash[:success] = t('flash.session.create.success') + ", #{params[:username]}."
      redirect_to root_url
    else
      flash.now[:error] = t('flash.session.create.error')
      render 'new'
    end
  end

  def destroy
    cookies.delete(:remember_token)
    redirect_to root_url, notice: "Logged out!"
  end

end
