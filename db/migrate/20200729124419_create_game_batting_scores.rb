class CreateGameBattingScores < ActiveRecord::Migration[6.0]
  def change
    create_table :game_batting_scores do |t|
      t.references :game,         null: false, foreign_key: true, comment: '試合ID'
      t.integer    :order,        null: false,                    comment: '打順'
      t.references :position,     null: false, foreign_key: true, comment: 'ポジションID'
      t.references :batter_score, null: false, foreign_key: true, comment: '打者成績ID'

      t.timestamps
    end
  end
end
