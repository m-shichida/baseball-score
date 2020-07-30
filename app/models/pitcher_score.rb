# == Schema Information
#
# Table name: pitcher_scores
#
#  id                  :bigint           not null, primary key
#  all_out_count       :integer                                # 投球アウト
#  batter_count        :integer                                # 対戦打者数
#  completion_inning   :integer                                # 完了イニング
#  hit                 :integer                                # 被安打数
#  hold_point          :integer                                # ホールドポイント
#  homerun             :integer                                # 被本塁打
#  losses              :integer                                # 敗戦数
#  out_count           :integer                                # 途中アウト
#  pitching_count      :integer                                # 投球数
#  save_count          :integer                                # セーブ数
#  self_responsibility :integer                                # 自責点
#  strikeout           :integer                                # 奪三振数
#  walk_dead_ball      :integer                                # 与四死球
#  wins                :integer                                # 勝利数
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#  player_id           :bigint           not null              # 選手ID
#
# Indexes
#
#  index_pitcher_scores_on_player_id  (player_id)
#
# Foreign Keys
#
#  fk_rails_...  (player_id => players.id)
#
class PitcherScore < ApplicationRecord
  belongs_to :player
end
