# == Schema Information
#
# Table name: positions
#
#  id         :bigint           not null, primary key
#  name       :string           not null              # ポジション名
#  name_kanji :string           not null              # ポジション名(漢字)
#  name_short :string           not null              # ポジション名(省略)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
require 'rails_helper'

RSpec.describe Position, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
