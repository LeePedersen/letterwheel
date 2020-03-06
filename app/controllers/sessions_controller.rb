class SessionsController < ApplicationController

  def create
    @user = User.authenticate(params[:email], params[:password])
    if @user
      reset_session
      flash[:notice] = "You've signed in."
      session[:user_id] = @user.id
      current_time = Time.new
      session[:updated_at] = current_time
      redirect_to "/conversations"
    else
      flash[:alert] = "There was a problem signing in. Please try again."
      redirect_to signin_path
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:notice] = "You've signed out."
    redirect_to "/"
  end

end
