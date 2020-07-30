module GamesHelper
  def team_select_value(teams)
    teams.map {|team| [team.name, team.id]}
  end

  def position_select_value
    Position.all.map {|position| [position.name_short, position.id]}
  end

  def player_select_value
    @current_team.players.map {|player| [player.full_name, player.id]}
  end
end
