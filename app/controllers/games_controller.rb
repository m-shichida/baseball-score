class GamesController < ApplicationController
  def index
    @games = current_team.games
  end

  def new
    @game = current_team.games.build
    @opponent_teams = Team.opponent_teams
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
    params.permit(:own_team_id, :opponent_team_id, :result, :matched_at)
  end
end
