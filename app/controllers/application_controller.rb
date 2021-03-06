class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def hello
    redirect_to controller: 'sessions', action: 'new' unless session[:name]
  end

# current_user
  #   returns the name of the current user
  #   returns nil if nobody is logged in
  def current_user
    session[:name]
  end

  private

  def require_logged_in
    # user is redirected to the views/sessions/new file
    redirect_to controller: 'sessions', action: 'new' unless current_user
  end
end