class Message < ApplicationRecord
  belongs_to :sender, polymorphic: true
  belongs_to :receiver, polymorphic: true

  enum message_type: { text: 0, audio: 1 }
  
  validates :content, :canonical_id, presence: true

  before_validation :assign_canonical
  before_create :send_sms


  def self.save_batch(sender_id:, receiver_ids:, message:)
    canonical_id = SecureRandom.uuid

    sender = Teacher.find(sender_id)

    receiver_ids.each do |receiver_id|
      receiver = Student.find(receiver_id)

      Message.create(sender: sender, receiver: receiver, content: message, canonical_id: canonical_id)
    end
  end

  private

  def assign_canonical
    return if self.canonical_id.present?
    self.canonical_id = SecureRandom.uuid
  end

  def send_sms
    return unless self.message_type == 'text'
    Sms.new.send(sms_params)
  end

  def sms_params
    { message: content, sender: sender.phone_number, receiver: receiver.phone_number}
  end
end
