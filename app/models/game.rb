# == Schema Information
#
# Table name: games
#
#  id               :bigint           not null, primary key
#  matched_at       :datetime         not null              # 試合日
#  result           :integer          not null              # 勝敗結果
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  opponent_team_id :bigint           not null              # 相手チーム
#  own_team_id      :bigint           not null              # 自チーム
#
# Indexes
#
#  index_games_on_opponent_team_id  (opponent_team_id)
#  index_games_on_own_team_id       (own_team_id)
#
# Foreign Keys
#
#  fk_rails_...  (opponent_team_id => teams.id)
#  fk_rails_...  (own_team_id => teams.id)
#
class Game < ApplicationRecord
  has_many :inning_scores

  belongs_to :team

  validates :own_team_id, presence: true
  validates :opponent_team_id, presence: true
  validates :result, presence: true
  validates :matched_at, presence: true

  enum result: { win: 0, lose: 1 }
end
