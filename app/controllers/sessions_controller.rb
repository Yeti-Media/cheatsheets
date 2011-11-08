class SessionsController < ApplicationController
  before_filter :authenticate!, :only => [:destroy]


  def create
    auth = request.env["omniauth.auth"]
    user = User.where(:provider => auth["provider"]).where(:uid =>auth["uid"]).first || User.create_with_omniauth(auth)
    session[:user_id] = user.id
    redirect_to cheatsheets_path, :notice => "Signed in!"
  end

  def destroy
    session[:user_id] = nil
    redirect_to home_path, :notice => "Signed out!"
  end
end

