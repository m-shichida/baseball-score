class TeamsController < ApplicationController
  # 登録・更新・削除は全て一覧で行うので非同期で処理する

  def index
    @teams = Team.all
  end

  def create
    team = Team.new(permit_params)
    if team.save
      render json: {
        status: 200,
        message: 'チームを登録しました',
        team: team.as_json,
      }
    else
      render json: {
        status: 400,
        message: 'チーム登録に失敗しました'
      }
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
      render json: {
        status: 400,
        message: '更新に失敗しました'
      }
    end
  end

  def destroy
    team = Team.find(params[:id])
    if team.destroy(permit_params)
      render json: {
        status: 200,
        message: 'チームを削除しました'
      }
    else
      render json: {
        status: 400,
        message: 'チームの削除に失敗しました'
      }
    end
  end

  private

  def permit_params
    params.require(:team).permit(:name)
  end
end
