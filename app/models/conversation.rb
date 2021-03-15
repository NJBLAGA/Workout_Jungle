class Conversation < ApplicationRecord
  #Blongs to a sender and a recipient
  belongs_to :sender, foreign_key: :sender_id, class_name: "User", dependent: :destroy
  belongs_to :recipient, foreign_key: :recipient_id, class_name: "User", dependent: :destroy

  #Has many messages
  has_many :messages, dependent: :destroy
  #validation
  validates_uniqueness_of :sender_id, scope: :recipient_id

  #This scope validation takes the sender_id and recipient_id for the conversation and checks whether a conversation exists between the two ids because we only want two users to have one conversation.
  #Queries database through :between (defined below)
  scope :between, -> (sender_id, recipient_id) do
    where("(conversations.sender_id = ? AND conversations.recipient_id = ?) OR (conversations.sender_id = ? AND conversations.recipient_id = ?)", sender_id, recipient_id, recipient_id, sender_id)
  end
end
