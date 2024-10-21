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
  "intro" => "this is a walk i took for orca jam 2024.",
  "qwench (bare) - this!" => "qwench!",
  "qwench bathroom" => "bathroom go brr",
  "street outside qwench - thanku!" => "looks like it's raining...",
  "dead-end garage" => "",
  "deadend" => "",
  "duke saloon" => "",
  "store st near vv" => "",
  "vv inside" => "",
  "vv to pinhalla" => "",
  "pinhalla 1" => "",
  "leaving pinhalla" => "",
  "fisgard idling" => "",
  "fantan is closed" => "",
  "fantan entrance closed" => "",
  "leaving fantan to govt" => "",
  "from govt fisgard to square" => "",
  "centennial square idle" => "",
  "check out ghost tour" => "",
  "visit fountain" => "",
  "at fount" => "",
  "walk to playhouse" => "",
  "entering playhouse" => "",
  "leave playhouse to market" => "",
  "cutting thru market" => "",
  "johnson after market" => "",
  "enter lush alley" => "",
  "lush alley" => "",
  "alley thru timewarp" => "",
  "wharf by bridge" => "",
  "down to bridge" => "",
  "under bridge" => "",
  "home" => ""
}

button_data = {
  "start" => [
    "intro",
    "qwench (bare) - this!"
  ],
  "go outside" => [
    "qwench (bare) - this!",
    "street outside qwench - thanku!"
  ],
  "go back inside" => [
    "street outside qwench - thanku!",
    "qwench (bare) - this!"
  ],
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
