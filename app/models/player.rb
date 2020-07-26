# == Schema Information
#
# Table name: players
#
#  id                          :bigint           not null, primary key
#  first_name(名)              :string           not null
#  last_name(姓)               :string           not null
#  number(背番号)              :integer          not null
#  created_at                  :datetime         not null
#  updated_at                  :datetime         not null
#  team_id(紐付け先のチームid) :bigint           not null
#
# Indexes
#
#  index_players_on_team_id  (team_id)
#
class Player < ApplicationRecord
  belongs_to :team

  validates :last_name, presence: true
  validates :first_name, presence: true
  validates :number, presence: true
  validates :team_id, presence: true
  validate :invalid_same_number

  scope :same_team_players, ->(team_id) { where(team_id: team_id) }

  def full_name
    "#{last_name} #{first_name}"
  end

  private

  def invalid_same_number
    return unless Player.same_team_players(team_id).where.not(id: id).pluck(:number).include?(number)

    errors[:base] << I18n.t('custom_errors.invalid_same_player_number')
  end
end
