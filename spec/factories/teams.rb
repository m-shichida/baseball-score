# == Schema Information
#
# Table name: teams
#
#  id             :bigint           not null, primary key
#  name(チーム名) :string           not null
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#
FactoryBot.define do
  factory :team do
    name { '埼玉西武ライオンズ' }
  end
end
