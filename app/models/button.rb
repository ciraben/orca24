class Button < ApplicationRecord
  belongs_to :location, class_name: "Room"
  belongs_to :destination, class_name: "Room"
end
