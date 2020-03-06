class ApplicationController < ActionController::Base

  protect_from_forgery with: :exception
  helper_method :current_user

  def current_user
    if session[:user_id]
      return @current_user ||= User.find(session[:user_id])
    end
  end

  def authorize
    if !current_user
      flash[:alert] = "You need to sign in."
      redirect_to '/'
    end
  end

  def authorize_conversation(user, conversation)
    if current_user.id != conversation.user1_id && current_user.id != conversation.user2_id
      flash[:alert] = 'You are not authorized to access that feature.'
      redirect_to '/'
    end
  end

end
