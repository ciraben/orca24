class Room < ApplicationRecord
  has_many :buttons

  validates :description, presence: true
  validates :label, presence: true
end
