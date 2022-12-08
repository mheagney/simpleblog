class SessionsController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.find_by(email: session_params[:email])

    if @user && @user.authenticate(session_params[:password])
      session[:user_id] = @user.id
      redirect_to posts_path
    else
      if @user.nil?
        @user = User.new
        @user.errors.add(:email)
      end
      @user.errors.add(:password)
    end
  end

  def destroy
    session.delete(:user_id)
    @current_user = nil
    redirect_to posts_path
  end

  private

  def session_params
    params.require(:user).permit(:email, :password)
  end
end
