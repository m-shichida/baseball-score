class CreateTeams < ActiveRecord::Migration[6.0]
  def change
    create_table :teams do |t|
      t.string :name, null: false, comment: 'チーム名'

      t.timestamps
    end
  end
end
