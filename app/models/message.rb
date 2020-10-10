class Message < ApplicationRecord
  belongs_to :sender, polymorphic: true
  belongs_to :receiver, polymorphic: true
  
  validates :content, presence: true

  def displayed_message
    {
      id: self.id,
      content: self.content,
      sender: self.sender,
      receiver: self.receiver,
      created_at: self.created_at,
      updated_at: self.updated_at,
    }
  end
end
