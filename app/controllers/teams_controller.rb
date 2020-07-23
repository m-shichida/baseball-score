class TeamsController < ApplicationController
  # 今はセッション管理してないのでこれで行くけどセッション管理するようになれば外す
  protect_from_forgery except: %i[create update destroy]

  before_action :not_base_team_destroy, only: %i[destroy]

  def index
    @teams = Team.all
  end

  def create
    team = Team.new(permit_params)
    if team.valid?
      team.save
      render json: {
        status: 200,
        message: 'チームを登録しました',
        team: team.as_json
      }
    else
      render json: error_hash('チーム登録に失敗しました')
    end
  end

  def update
    team = Team.find(params[:id])
    if team.update(permit_params)
      render json: {
        status: 200,
        message: '更新が完了しました',
        team: team.as_json
      }
    else
      render json: error_hash('更新に失敗しました')
    end
  end

  def destroy
    team = Team.find(params[:id])
    if team.destroy
      render json: {
        status: 200,
        message: 'チームを削除しました'
      }
    else
      render json: error_hash('チームの削除に失敗しました')
    end
  end

  private

  def permit_params
    params.require(:team).permit(:name)
  end

  def error_hash(message)
    {
      status: 400,
      message: message
    }
  end

  def not_base_team_destroy
    team = Team.find(params[:id])
    if team.base?
      render json: {
        status: 400,
        message: '自チームを削除することはできません'
      }
    end
  end
end
