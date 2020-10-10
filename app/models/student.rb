class Student < ApplicationRecord
  validates :name, :phone_number, presence: true
end
