class Teacher < ApplicationRecord
  has_many :sent_messages, as: :sender, dependent: :destroy, class_name: "Message"
  has_many :received_messages, as: :receiver, dependent: :destroy, class_name: "Message"

  validates :name, :email, :phone_number, presence: true
  validates :email, :phone_number, uniqueness: true
end
