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
  "dead-end garage" => "nice tunes..",
  "deadend" => "hmm, nothing here",
  "duke saloon" => "outside the saloon",
  "store st near vv" => "...",
  "vv inside" => "...",
  "vv to pinhalla" => "...",
  "pinhalla 1" => "...",
  "leaving pinhalla" => "...",
  # "fisgard idling" => "...",
  "fantan is closed" => "...",
  # "fantan entrance closed" => "...",
  "leaving fantan to govt" => "...",
  # "from govt fisgard to square" => "...",
  "centennial square idle" => "...",
  "check out ghost tour" => "...",
  "visit fountain" => "...",
  "walk to playhouse" => "...",
  "entering playhouse" => "...",
  "leave playhouse to market" => "...",
  "cutting thru market" => "...",
  # "johnson after market" => "...",
  "enter lush alley" => "...",
  # "lush alley" => "...",
  "alley thru timewarp" => "...",
  # "wharf by bridge" => "...",
  # "down to bridge" => "...",
  # "under bridge" => "...",
  "home" => "the end! after that i biked home"
}

button_data = {
  "start" => [
    "intro",
    "qwench (bare) - this!"
  ],

  "find a quiet corner" => [
    "qwench (bare) - this!",
    "qwench bathroom"
  ],
  "go outside" => [
    "qwench (bare) - this!",
    "street outside qwench - thanku!"
  ],

  "okay, back to the fray" => [
    "qwench bathroom",
    "qwench (bare) - this!"
  ],

  "go back inside" => [
    "street outside qwench - thanku!",
    "qwench (bare) - this!"
  ],
  "head north!" => [
    "street outside qwench - thanku!",
    "dead-end garage"
  ],
  "head south!" => [
    "street outside qwench - thanku!",
    "duke saloon"
  ],

  "investigate dead-end" => [
    "dead-end garage",
    "deadend"
  ],
  "turn back" => [
    "dead-end garage",
    "street outside qwench - thanku!"
  ],

  "nevermind..." => [
    "deadend",
    "street outside qwench - thanku!"
  ],

  "keep heading into town" => [
    "duke saloon",
    "store st near vv"
  ],
  "what about back up the street?" => [
    "duke saloon",
    "street outside qwench - thanku!"
  ],

  "check out the general store" => [
    "store st near vv",
    "vv inside"
  ],
  "check out the flashy bar" => [
    "store st near vv",
    "pinhalla 1"
  ],

  "all done thrifting" => [
    "vv inside",
    "vv to pinhalla"
  ],
  "stay and vibe" => [
    "vv to pinhalla",
    "pinhalla 1"
  ],

  "alright, time to go" => [
    "pinhalla 1",
    "leaving pinhalla"
  ],

  "explore the enticing alley" => [
    "leaving pinhalla",
    "fantan is closed"
  ],
  "better keep moving then" => [
    "fantan is closed",
    "leaving fantan to govt"
  ],

  "check what's going on in the square..." => [
    "leaving fantan to govt",
    "centennial square idle"
  ],

  "investigate the group huddled to the south" => [
    "centennial square idle",
    "check out ghost tour"
  ],
  "check out the fountain" => [
    "centennial square idle",
    "visit fountain"
  ],
  "take a closer look at the playhouse" => [
    "centennial square idle",
    "walk to playhouse"
  ],

  "better not linger too long" => [
    "check out ghost tour",
    "walk to playhouse"
  ],
  "head down to the glowing building" => [
    "visit fountain",
    "walk to playhouse"
  ],

  "go inside?" => [
    "walk to playhouse",
    "entering playhouse"
  ],
  "better leave before security gets annoyed" => [
    "entering playhouse",
    "leave playhouse to market"
  ],
  "find shelter in the alley" => [
    "leave playhouse to market",
    "enter lush alley"
  ],

  "keep heading west" => [
    "walk to playhouse",
    "cutting thru market"
  ],
  "seek shelter in the alley" => [
    "cutting thru market",
    "enter lush alley",
  ],

  "you think you hear something..." => [
    "enter lush alley",
    "alley thru timewarp"
  ],

  "..." => [
    "alley thru timewarp",
    "home"
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
