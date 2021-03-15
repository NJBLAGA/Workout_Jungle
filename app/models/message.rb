class Message < ApplicationRecord
  #Belongs to a conversation
  belongs_to :conversation
  #Belongs to a user
  belongs_to :user
  #Validations presence
  validates_presence_of :body, :conversation_id, :user_id
  #Helper that creates time format for each message
  def message_time
    created_at.strftime("%m/%d/%y at %l:%M %p")
  end
end
