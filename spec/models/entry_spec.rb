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

require 'spec_helper'

describe Entry do
    before do
       @entry = Entry.new
    end

    subject { @entry }

    it { should respond_to(:name) }
end
