class GamesController < ApplicationController
  def index
    @games = current_team.games
  end

  def new
    @game = current_team.games.build
    @teams = Team.all
    @opponent_teams = Team.opponent_teams
    @inning_scores = @game.inning_scores.build
    @batting_scores = @game.batter_scores.build
  end

  def create
    game = current_team.games.build(permit_params)
    if game.save
      redirect_to games_path(game), notice: I18n.t('view.flash.registrate', name: I18n.t('activerecord.models.game'))
    else
      render :new
    end
  end

  def edit
    @game = current_team.games.find(params[:id])
    @inning_scores = @game.inning_scores
  end

  def update
    game = current_team.games.find(params[:id])
    if game.update
      redirect_to games_path(game), notice: I18n.t('view.flash.update', name: I18n.t('activerecord.models.game'))
    else
      render :edit
    end
  end

  def destroy
    game = current_team.games.find(params[:id])
    if game.destroy
      redirect_to games_path, notice: I18n.t('view.flash.destroy', name: I18n.t('activerecord.models.game'))
    else
      render :edit
    end
  end

  private

  def permit_params
    params.permit(:own_team_id, :opponent_team_id, :result, :matched_at,
                  inning_scores_attributes: %i[id inning order score game_id team_id _destroy])
  end
end
