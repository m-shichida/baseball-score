# == Schema Information
#
# Table name: teams
#
#  id         :bigint           not null, primary key
#  base       :boolean          default(FALSE), not null # 成績管理をするベースチームかどうか
#  name       :string           not null                 # チーム名
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
require 'rails_helper'

RSpec.describe Team, type: :model do
  describe 'バリデーションチェック' do
    it 'チーム名がなければ無効であること' do
      team = build(:team, name: nil)
      team.valid?
      expect(team.errors[:name]).to include 'を入力してください'
    end
  end
end
