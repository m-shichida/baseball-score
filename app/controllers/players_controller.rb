class PlayersController < ApplicationController
  def index
    @players = current_team.players.all
  end
end
