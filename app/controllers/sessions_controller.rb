class SessionsController < ApplicationController
  def create
    @oauth = Oauth.find_or_initialize_from_auth_hash(auth_hash)
    if @oauth.user.blank?
      @user = User.create
      @oauth.user = @user
    end
    @oauth.save

    session[:user_id] = @oauth.user_id
    redirect_to root_path
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path
  end

  protected

  def auth_hash
    request.env['omniauth.auth']
  end
end