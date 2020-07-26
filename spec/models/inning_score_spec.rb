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
require 'rails_helper'

RSpec.describe InningScore, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
