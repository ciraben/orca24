class Room < ApplicationRecord
  has_many :buttons, foreign_key: "location_id"

  validates :description, presence: true
  validates :label, presence: true
end
