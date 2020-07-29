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
FactoryBot.define do
  factory :team do
    trait :base_team do
      name { '埼玉西武ライオンズ' }
      base { true }
    end

    trait :opponent_team do
      name { '東北楽天ゴールデンイーグルス' }
      base { false }
    end

    factory :base_team, traits: %i[base_team]
    factory :opponent_team, traits: %i[opponent_team]
  end
end
