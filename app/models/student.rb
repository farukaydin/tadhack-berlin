class Student < ApplicationRecord
  validates :name, :phone_number, presence: true
  validates :phone_number, uniqueness: true
end
