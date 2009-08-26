# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
      helper_method :current_user, :logged_in?
  helper :all # include all helpers, all the time
  protect_from_forgery # See ActionController::RequestForgeryProtection for details

  # Scrub sensitive parameters from your log
  # filter_parameter_logging :password
    
   before_filter :require_login
   
   def require_login
     unless logged_in?
       flash[:error] = "You must be logged in to access this section"
       redirect_to login_url # halts request cycle
     end
   end 
   
   def logged_in?
    !!current_user
   end
  
  def current_user_session
    return @current_user_session if defined?(@current_user_session)
    @current_user_session = UserSession.find
  end
  
  def current_user
    return @current_user if defined?(@current_user)
    @current_user = current_user_session && current_user_session.record
  end
end
