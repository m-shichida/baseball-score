# == Schema Information
#
# Table name: games
#
#  id                           :bigint           not null, primary key
#  matched_at(試合日)           :datetime         not null
#  result(勝敗結果)             :integer          not null
#  created_at                   :datetime         not null
#  updated_at                   :datetime         not null
#  opponent_team_id(相手チーム) :bigint           not null
#  own_team_id(自チーム)        :bigint           not null
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
FactoryBot.define do
  factory :game do
    opponent_team nil
  end
end
