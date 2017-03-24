# == Schema Information
#
# Table name: bills
#
#  id            :integer          not null, primary key
#  customer_id   :integer
#  state_id      :integer
#  date          :datetime
#  cash_discount :integer
#  state         :boolean
#  delete_at     :datetime
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

require 'test_helper'

class BillTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
