class Student < ApplicationRecord
  has_many :messages, dependent: :destroy

  validates :name, :phone_number, presence: true
  validates :phone_number, uniqueness: true
end
