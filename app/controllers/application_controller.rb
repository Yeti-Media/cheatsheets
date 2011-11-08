class ApplicationController < ActionController::Base
  layout 'application'

  protect_from_forgery


  helper_method :current_user , :super_admin?

  private

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def signed_in?
    !!current_user
  end

  def authenticate!
    signed_in? || access_denied
  end

  def access_denied
    flash[:notice] = "Please Authenticate First"
    redirect_to home_path
    return false
  end

  def super_admin?
    Settings.admin.include?(current_user.uid)
  end

end

