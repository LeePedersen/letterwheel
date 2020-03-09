class MessagesController < ApplicationController

  before_action do
    @user = User.find(session[:user_id])
    @conversations = Conversation.where("user1_id = ? OR user2_id = ?", @user.id, @user.id)
    @conversation = Conversation.find(params[:conversation_id])
    authorize_conversation(@user, @conversation)
  end

  def index
    @messages = @conversation.messages
    # if @messages.length > 10
    #   @over_ten = true
    #   @messages = @messages[-10..-1]
    # end
    # if params[:m]
    #   @over_ten = false
    #   @messages = @conversation.messages
    # end
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
    @message = @conversation.messages.new(message_params)
    if @message.save
      redirect_to conversation_messages_path(@conversation)
    end
  end

  private

  def message_params
    params.require(:message).permit(:body, :user_id)
  end

end
