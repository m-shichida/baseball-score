class CreatePositions < ActiveRecord::Migration[6.0]
  def change
    create_table :positions do |t|
      t.string :name,       null: false, comment: 'ポジション名'
      t.string :name_kanji, null: false, comment: 'ポジション名(漢字)'
      t.string :name_short, null: false, comment: 'ポジション名(省略)'

      t.timestamps
    end
  end
end
