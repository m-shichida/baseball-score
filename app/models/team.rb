# == Schema Information
#
# Table name: teams
#
#  id             :bigint           not null, primary key
#  name(チーム名) :string           not null
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#
class Team < ApplicationRecord
  validates :name, presence: true
end
