# == Schema Information
#
# Table name: teams
#
#  id                                       :bigint           not null, primary key
#  base(成績管理をするベースチームかどうか) :boolean          default(FALSE), not null
#  name(チーム名)                           :string           not null
#  created_at                               :datetime         not null
#  updated_at                               :datetime         not null
#
class Team < ApplicationRecord
  has_many :players, dependent: :destroy
  has_many :games, class_name: 'Game', foreign_key: :own_team_id

  validates :name, presence: true

  scope :opponent_teams, -> { where(base: false) }
end
