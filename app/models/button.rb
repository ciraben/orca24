class Button < ApplicationRecord
  belongs_to :location, class_name: "Room"
  belongs_to :destination, class_name: "Room"

  validates :location, presence: true
  validates :destination, presence: true
end
