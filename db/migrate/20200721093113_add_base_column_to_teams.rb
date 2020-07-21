class AddBaseColumnToTeams < ActiveRecord::Migration[6.0]
  def change
    add_column :teams, :base, :boolean, default: false, null: false, comment: '成績管理をするベースチームかどうか'
  end
end
