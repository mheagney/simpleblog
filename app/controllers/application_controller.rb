class ApplicationController < ActionController::Base
  def authenticate_user
    if session[:user_id]
      @current_user ||= User.find_by(id: session[:user_id])
    end

    if @current_user.nil? || @current_user.invalid?
      flash[:error] = "You need to be a user to access that page"
      redirect_to root_path
    end
  end
end
