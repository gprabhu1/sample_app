# == Schema Information
#
# Table name: entries
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  winner     :boolean
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Entry < ActiveRecord::Base
  attr_accessible :name, :winner
end
