class Message < ApplicationRecord
  belongs_to :sender, polymorphic: true
  belongs_to :receiver, polymorphic: true

  enum message_type: { text: 0, audio: 1 }
  
  validates :content, presence: true

  before_create :send_sms

  def self.save_batch(sender_id:, receiver_ids:, message:)
    sender = Teacher.find(sender_id)

    receiver_ids.each do |receiver_id|
      receiver = Student.find(receiver_id)

      Message.create(sender: sender, receiver: receiver, content: message)
    end
  end

  private

  def send_sms
    return unless self.message_type == 'text'
    Sms.new.send(sms_params)
  end

  def sms_params
    { message: content, sender: sender.phone_number, receiver: receiver.phone_number}
  end
end
