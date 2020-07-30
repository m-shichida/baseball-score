class CreatePitcherScores < ActiveRecord::Migration[6.0]
  def change
    create_table :pitcher_scores do |t|
      t.references :player, null: false, foreign_key: true, comment: '選手ID'
      t.integer :completion_inning,                         comment: '完了イニング'
      t.integer :out_count,                                 comment: '途中アウト'
      t.integer :batter_count,                              comment: '対戦打者数'
      t.integer :pitching_count,                            comment: '投球数'
      t.integer :hit,                                       comment: '被安打数'
      t.integer :homerun,                                   comment: '被本塁打'
      t.integer :strikeout,                                 comment: '奪三振数'
      t.integer :walk_dead_ball,                            comment: '与四死球'
      t.integer :self_responsibility,                       comment: '自責点'
      t.integer :wins,                                      comment: '勝利数'
      t.integer :losses,                                    comment: '敗戦数'
      t.integer :save_count,                                comment: 'セーブ数'
      t.integer :hold_point,                                comment: 'ホールドポイント'
      t.integer :all_out_count,                             comment: '投球アウト'

      t.timestamps
    end
  end
end
