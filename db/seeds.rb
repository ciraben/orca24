# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
room_data = {
  "qwench (phone)" => "Qwench!",
  "street outside qwench - thanku!" => "sure is quiet out here...",
  "intro" => "This is a cute game i made for orca jam 2024."
}

button_data = {
  "go outside" => [
    "qwench (phone)",
    "street outside qwench - thanku!"
  ],
  "go back inside" => [
    "street outside qwench - thanku!",
    "qwench (phone)"
  ],
  "start" => [
    "intro",
    "qwench (phone)"
  ]
}

room_data.each do |label, description|
  Room.find_or_create_by(label: label) do |room|
    room.description = description
  end
end

button_data.each do |label, rooms|
  Button.find_or_create_by(label: label) do |button|
    button.label = label
    button.location = Room.find_by label: rooms[0]
    button.destination = Room.find_by label: rooms[1]
  end
end
