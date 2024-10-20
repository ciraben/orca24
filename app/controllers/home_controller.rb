class HomeController < ApplicationController
  def index
    @intro = Room.find_by label: "intro"
  end
end
