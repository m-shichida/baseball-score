# == Schema Information
#
# Table name: teams
#
#  id         :bigint           not null, primary key
#  base       :boolean          default(FALSE), not null
#  name       :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Team < ApplicationRecord
  has_many :players, dependent: :destroy

  validates :name, presence: true
end
