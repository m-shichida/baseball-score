class CreatePlayers < ActiveRecord::Migration[6.0]
  def change
    create_table :players do |t|
      t.string     :last_name,  null: false,              comment: '姓'
      t.string     :first_name, null: false,              comment: '名'
      t.integer    :number,     null: false,              comment: '背番号'
      t.references :team,       null: false, index: true, comment: '紐付け先のチームid'

      t.timestamps
    end
  end
end
