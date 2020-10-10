class Teacher < ApplicationRecord
  validates :name, :email, :phone_number, presence: true
  validates :email, :phone_number, uniqueness: true
end
