class Message < ActiveRecord::Base
  belongs_to :conversation
  belongs_to :user
  validates_presence_of :body, :conversation_id, :user_id

  def message_time
    # created_at.strftime("%m/%d/%y at %l:%M %p")
    created_at.strftime("%l:%M %p")
  end

  def encrypt_code_key
    self.code_key_salt = BCrypt::Engine.generate_salt
    self.code_key_hash = BCrypt::Engine.hash_secret(code_key, code_key_salt)
  end

end
