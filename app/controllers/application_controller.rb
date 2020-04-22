class ApplicationController < ActionController::Base
  #before_action :ensure_user_logged_in

  def current_user
    return @current_user if @current_user

    current_user_id = session[:current_user_id]
    if current_user_id and User.exists?(id = current_user_id)
      @current_user = User.find(current_user_id)
    else
      session[:current_user_id] = nil
      nil
    end
  end
end
