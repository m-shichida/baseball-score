class PlayersController < ApplicationController
  def index
    @players = current_team.players.all
    @player = current_team.players.build
  end

  def create
    @players = current_team.players.all
    player = current_team.players.build(permit_params)

    if player.save
      redirect_to players_path, notice: I18n.t('view.flash.registrate', name: player.full_name)
    else
      flash.now[:danger] = t('view.flash.error_registrate')
      render :index
    end
  end

  def update
    @players = current_team.players.all
    player = current_team.players.find(params[:id])

    if player.update(permit_params)
      redirect_to players_path, notice: I18n.t('view.flash.update', name: player.full_name)
    else
      flash.now[:danger] = t('view.flash.error_update')
      render :index
    end
  end

  def destroy
    player = Player.find(params[:id])
    if player.destroy
      redirect_to players_path, notice: I18n.t('view.flash.delete', name: player.full_name)
    else
      flash.now[:danger] = t('view.flash.error_destroy')
      render :index
    end
  end

  private

  def permit_params
    params.permit(:first_name, :last_name, :number)
  end
end
