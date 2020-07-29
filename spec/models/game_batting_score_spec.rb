# == Schema Information
#
# Table name: game_batting_scores
#
#  id              :bigint           not null, primary key
#  order           :integer          not null              # 打順
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  batter_score_id :bigint           not null              # 打者成績ID
#  game_id         :bigint           not null              # 試合ID
#  position_id     :bigint           not null              # ポジションID
#
# Indexes
#
#  index_game_batting_scores_on_batter_score_id  (batter_score_id)
#  index_game_batting_scores_on_game_id          (game_id)
#  index_game_batting_scores_on_position_id      (position_id)
#
# Foreign Keys
#
#  fk_rails_...  (batter_score_id => batter_scores.id)
#  fk_rails_...  (game_id => games.id)
#  fk_rails_...  (position_id => positions.id)
#
require 'rails_helper'

RSpec.describe GameBattingScore, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
