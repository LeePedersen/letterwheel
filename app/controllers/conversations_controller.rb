class ConversationsController < ApplicationController

  before_action :authorize

  def index
    @user = User.find(session[:user_id])
    @users = User.all
    @conversations = Conversation.where("user1_id = ? OR user2_id = ?", @user.id, @user.id)
    render :index
  end

  def new
    @conversation = Conversation.new
    @authenticity_token = session[:_csrf_token]
  end

  def create
    if Conversation.between(params[:user1_id], params[:user2_id]).present?
      @code_key = conversation_params['code_key']
      @conversation = Conversation.between(params[:user1_id],
        params[:user2_id]).first
    else
      @conversation = Conversation.create!({'user1_id'=>conversation_params[:user1_id], 'user2_id'=>conversation_params[:user2_id]})
      @code_key = conversation_params['code_key']
    end
    redirect_to conversation_messages_path(@conversation, {:code_key => @code_key})
  end



  private

  def conversation_params
    params.permit(:user1_id, :user2_id, :code_key)
  end

end
