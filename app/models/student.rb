class Student < ApplicationRecord
  has_many :sent_messages, as: :sender, dependent: :destroy, class_name: "Message"
  has_many :received_messages, as: :receiver, dependent: :destroy, class_name: "Message"

  validates :name, :phone_number, presence: true
  validates :phone_number, uniqueness: true
end
