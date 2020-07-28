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
#  rbi            :integer                                # 打点
#  sacrifice_fly  :integer                                # 犠飛
#  score          :integer                                # 得点
#  steal          :integer                                # 盗塁
#  strikeout      :integer                                # 三振
#  three_bases    :integer                                # 三塁打
#  two_bases      :integer                                # 二塁打
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  player_id      :bigint           not null              # 選手ID
#
# Indexes
#
#  index_batter_scores_on_player_id  (player_id)
#
# Foreign Keys
#
#  fk_rails_...  (player_id => players.id)
#
require 'rails_helper'

RSpec.describe BatterScore, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
