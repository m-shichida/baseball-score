class CreateInningScores < ActiveRecord::Migration[6.0]
  def change
    create_table :inning_scores do |t|
      t.references :game,   null: false, foreign_key: true, comment: '試合ID'
      t.references :team,   null: false, foreign_key: true, comment: 'チームID'
      t.integer    :score,  null: false, foreign_key: true, comment: '得点'
      t.integer    :inning, null: false,                    comment: 'イニング'
      t.integer    :order,  null: false,                    comment: '表か裏か'

      t.timestamps
    end
  end
end
