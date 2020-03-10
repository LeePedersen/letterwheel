class MessagesController < ApplicationController

  before_action do
    @user = User.find(session[:user_id])
    @conversations = Conversation.where("user1_id = ? OR user2_id = ?", @user.id, @user.id)
    @conversation = Conversation.find(params[:conversation_id])
    authorize_conversation(@user, @conversation)
  end

  def index
    @messages = @conversation.messages
    if current_user.id == @conversation.user1_id
      @other_user = User.find(@conversation.user2_id)
    else
      @other_user = User.find(@conversation.user1_id)
    end
    if @messages.last
      if @messages.last.user_id != current_user.id
        @messages.last.read = true;
      end
    end
    @message = @conversation.messages.new
  end

  def new
    @message = @conversation.messages.new
  end

  def create
    id = message_params['user_id']
    body = message_params['body']
    key = 5
    encoded_body = encode_message(body, key)
    @message = @conversation.messages.new({"body"=>encoded_body, "user_id"=>id})
    if @message.save
      redirect_to conversation_messages_path(@conversation)
    end
  end

  private

  def message_params
    params.require(:message).permit(:body, :user_id)
  end

end
