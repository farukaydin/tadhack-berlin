class Message < ApplicationRecord
  belongs_to :sender, polymorphic: true
  belongs_to :receiver, polymorphic: true

  enum message_type: { text: 0, audio: 1 }
  
  validates :content, presence: true

  before_create :send_sms

  private

  def send_sms
    if(message_type.text == text)
      Sms.new.send(
        message: content,
        sender: sender.phone_number,
        receiver: receiver.phone_number
      )
    end
  end
end
