class CreateBatterScores < ActiveRecord::Migration[6.0]
  def change
    create_table :batter_scores do |t|
      t.references :game,         null: false, foreign_key: true, comment: '試合ID'
      t.references :player,       null: false, foreign_key: true, comment: '選手ID'
      t.references :position,     null: false, foreign_key: true, comment: 'ポジションID'
      t.integer    :order,        null: false,                    comment: '打順'
      t.integer    :bats,                                         comment: '打席数'
      t.integer    :four_dead_ball,                               comment: '四死球'
      t.integer    :bunt,                                         comment: '犠打'
      t.integer    :sacrifice_fly,                                comment: '犠飛'
      t.integer    :score,                                        comment: '得点'
      t.integer    :hit,                                          comment: '安打(長打含む)'
      t.integer    :rbi,                                          comment: '打点'
      t.integer    :strikeout,                                    comment: '三振'
      t.integer    :steal,                                        comment: '盗塁'
      t.integer    :two_bases,                                    comment: '二塁打'
      t.integer    :three_bases,                                  comment: '三塁打'
      t.integer    :homerun,                                      comment: '本塁打'
      t.integer    :error,                                        comment: '失策'

      t.timestamps
    end
  end
end
