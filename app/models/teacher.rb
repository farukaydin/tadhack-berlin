class Teacher < ApplicationRecord
  has_many :messages, dependent: :destroy

  validates :name, :email, :phone_number, presence: true
  validates :email, :phone_number, uniqueness: true
end
