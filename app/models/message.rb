class Message < ActiveRecord::Base
  belongs_to :conversation
  belongs_to :user
  validates_presence_of :body, :conversation_id, :user_id

  def message_time
    created_at.strftime("%m/%d/%y at %l:%M %p")
  end

  # def encode_message(message, key)
  #   alphabet = ('a'..'z').to_a
  #   alphabet_slice_first = alphabet.slice(key..-1)
  #   alphabet_slice_last = alphabet.slice(0..(key-1))
  #   encoded_alphabet = alphabet_slice_first + alphabet_slice_last
  #   message_array = message.split('')
  #   coded_message_array = []
  #   message_array.each do |char|
  #     if alphabet.include?(char)
  #       new_char = encoded_alphabet[alphabet.find_index(char)]
  #       coded_message_array.push(new_char)
  #     else
  #       coded_message_array.push(char)
  #     end
  #   end
  #   encoded_message = coded_message_array.join
  # end
  #
  # def decode_message(message, key)
  #   alphabet = ('a'..'z').to_a
  #   alphabet_slice_first = alphabet.slice(key..-1)
  #   alphabet_slice_last = alphabet.slice(0..(key-1))
  #   encoded_alphabet = alphabet_slice_first + alphabet_slice_last
  #   encoded_message_array = message.split('')
  #   decoded_message_array = []
  #   encoded_message_array.each do |char|
  #     if encoded_alphabet.include?(char)
  #       new_char = alphabet[encoded_alphabet.find_index(char)]
  #       decoded_message_array.push(new_char)
  #     else
  #       decoded_message_array.push(char)
  #     end
  #   end
  #   decoded_message = decoded_message_array.join
  # end

  def self.encode_message(key)
    alphabet = ('a'..'z').to_a
    alphabet_slice_first = alphabet.slice(key..-1)
    alphabet_slice_last = alphabet.slice(0..(key-1))
    encoded_alphabet = alphabet_slice_first + alphabet_slice_last
    message_array = self.body.split('')
    coded_message_array = []
    message_array.each do |char|
      if alphabet.include?(char)
        new_char = encoded_alphabet[alphabet.find_index(char)]
        coded_message_array.push(new_char)
      else
        coded_message_array.push(char)
      end
    end
    encoded_message = coded_message_array.join
  end

end
