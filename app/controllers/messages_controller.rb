class MessagesController < ApplicationController

  before_action do
    @user = User.find(session[:user_id])
    @conversations = Conversation.where("user1_id = ? OR user2_id = ?", @user.id, @user.id)
    @conversation = Conversation.find(params[:conversation_id])
    authorize_conversation(@user, @conversation)
    if !@code_key
      @code_key = params[:code_key]
    end
  end

  def index
    @messages = []
    @coded_messages = @conversation.messages
    @coded_messages.each do |message|
      @messages.push(decode_message(message.body, @code_key.to_i))
    end
    if current_user.id == @conversation.user1_id
      @other_user = User.find(@conversation.user2_id)
    else
      @other_user = User.find(@conversation.user1_id)
    end
    if @coded_messages.last
      if @coded_messages.last.user_id != current_user.id
        @coded_messages.each do |message|
          message.update({read: true})
        end
      end
    end
    @message = @conversation.messages.new
  end

  def create
    id = message_params['user_id']
    body = message_params['body']
    encoded_body = encode_message(body, @code_key.to_i)
    @message = @conversation.messages.new({"body"=>encoded_body, "user_id"=>id})
    if @message.save
      redirect_to conversation_messages_path(@conversation, {:code_key => @code_key})
    end
  end

  private

  def message_params
    params.require(:message).permit(:body, :user_id, :read)
  end

end
