class CreateGames < ActiveRecord::Migration[6.0]
  def change
    create_table :games do |t|
      t.references :own_team,       null: false, foreign_key: { to_table: :teams }, comment: '自チーム'
      t.references :opponent_team,  null: false, foreign_key: { to_table: :teams }, comment: '相手チーム'
      t.integer    :result,         null: false,                                    comment: '勝敗結果'
      t.datetime   :matched_at,     null: false,                                    comment: '試合日'

      t.timestamps
    end
  end
end
