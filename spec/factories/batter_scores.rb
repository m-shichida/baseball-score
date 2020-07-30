# == Schema Information
#
# Table name: batter_scores
#
#  id             :bigint           not null, primary key
#  bats           :integer                                # 打席数
#  bunt           :integer                                # 犠打
#  error          :integer                                # 失策
#  four_dead_ball :integer                                # 四死球
#  hit            :integer                                # 安打(長打含む)
#  homerun        :integer                                # 本塁打
#  order          :integer          not null              # 打順
#  rbi            :integer                                # 打点
#  sacrifice_fly  :integer                                # 犠飛
#  score          :integer                                # 得点
#  steal          :integer                                # 盗塁
#  strikeout      :integer                                # 三振
#  three_bases    :integer                                # 三塁打
#  two_bases      :integer                                # 二塁打
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  game_id        :bigint           not null              # 試合ID
#  player_id      :bigint           not null              # 選手ID
#  position_id    :bigint           not null              # ポジションID
#
# Indexes
#
#  index_batter_scores_on_game_id      (game_id)
#  index_batter_scores_on_player_id    (player_id)
#  index_batter_scores_on_position_id  (position_id)
#
# Foreign Keys
#
#  fk_rails_...  (game_id => games.id)
#  fk_rails_...  (player_id => players.id)
#  fk_rails_...  (position_id => positions.id)
#
FactoryBot.define do
  factory :batter_score do
    position nil
  end
end
