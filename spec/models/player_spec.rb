# == Schema Information
#
# Table name: players
#
#  id         :bigint           not null, primary key
#  first_name :string           not null
#  last_name  :string           not null
#  number     :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  team_id    :bigint           not null
#
# Indexes
#
#  index_players_on_team_id  (team_id)
#
require 'rails_helper'

RSpec.describe Player, type: :model do
  describe 'バリデーションチェック' do
    it '姓がなければ無効であること' do
      player = build(:player, last_name: nil)
      player.valid?
      expect(player.errors[:last_name]).to include 'を入力してください'
    end

    it '名がなければ無効であること' do
      player = build(:player, first_name: nil)
      player.valid?
      expect(player.errors[:first_name]).to include 'を入力してください'
    end

    it '背番号がなければ無効であること' do
      player = build(:player, number: nil)
      player.valid?
      expect(player.errors[:number]).to include 'を入力してください'
    end

    it '同じチームで同じ背番号は無効であること' do
      team = create(:opponent_team)
      create(:player, number: 48, team_id: team.id)
      same_number_player = build(:player, number: 48, team_id: team.id)
      same_number_player.valid?
      expect(same_number_player.errors[:base][0]).to eq '同じ背番号では登録できません'
    end

    it '紐付け先のチームIDがなければ無効であること' do
      player = build(:player, team_id: nil)
      player.valid?
      expect(player.errors[:team_id]).to include 'を入力してください'
    end

    it '姓、名、背番号、紐付け先のチームIDがあれば有効であること' do
      team = create(:opponent_team)
      player = build(:player, last_name: '外崎', first_name: '修汰', number: 5, team_id: team.id)
      player.valid?
      expect(player).to be_valid
    end
  end
end
