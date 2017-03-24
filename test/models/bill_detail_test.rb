# == Schema Information
#
# Table name: bill_details
#
#  id         :integer          not null, primary key
#  bill_id    :integer
#  product_id :integer
#  quantity   :integer
#  delete_at  :datetime
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'test_helper'

class BillDetailTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
