# == Schema Information
#
# Table name: inning_scores
#
#  id                :bigint           not null, primary key
#  inning(イニング)  :integer          not null
#  order(表か裏か)   :integer          not null
#  score(得点)       :integer          not null
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  game_id(試合ID)   :bigint           not null
#  team_id(チームID) :bigint           not null
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

  enum score: { top: 0, bottom: 1 }
end
