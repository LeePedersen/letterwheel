class ConversationsChannel < ApplicationCable::Channel

  def subscribed
    stream_from "conversations_#{params['conversation_id']}_channel"
  end

  def unsubscribed
  end

  def send_message(data)
    current_user.messages.create!(body: data['message'], conversation_id: data['chat_room_id'])
  end

end
