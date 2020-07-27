# == Schema Information
#
# Table name: inning_scores
#
#  id         :bigint           not null, primary key
#  inning     :integer          not null              # イニング
#  order      :integer          not null              # 表か裏か
#  score      :integer          not null              # 得点
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  game_id    :bigint           not null              # 試合ID
#  team_id    :bigint           not null              # チームID
#
# Indexes
#
#  index_inning_scores_on_game_id  (game_id)
#  index_inning_scores_on_team_id  (team_id)
#
# Foreign Keys
#
#  fk_rails_...  (game_id => games.id)
#  fk_rails_...  (team_id => teams.id)
#
class InningScore < ApplicationRecord
  belongs_to :game

  validates :inning, presence: true
  validates :order, presence: true
  validates :score, presence: true
  validates :team_id, presence: true
  validates :game_id, presence: true

  enum order: { top: 0, bottom: 1 }
end
