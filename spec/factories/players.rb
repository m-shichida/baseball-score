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
FactoryBot.define do
  factory :player do
    last_name  { '源田' }
    first_name { '壮亮' }
    number     { 6 }
  end
end
