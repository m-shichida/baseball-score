module GamesHelper
  def team_select_value(teams)
    teams.map { |team| [team.name, team.id] }
  end
end
