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
