class ApplicationController < ActionController::Base
  protect_from_forgery
  
  def not_found
    render "error_pages/404"
  end
    
  def authenticate
    if session[:admin]
      return true
    else
      redirect_to "/login"
    end
  end
  
end
