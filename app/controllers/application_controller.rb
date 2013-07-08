class ApplicationController < ActionController::Base
  protect_from_forgery
  
   
  def after_sign_in_path_for(resource)
    "/users/main"
  end
  
  def after_sign_up_path_for(resource)
  "/users/main"
  end
  
  def after_sign_out_path_for(resource)
     "/users/main"
  end
end
