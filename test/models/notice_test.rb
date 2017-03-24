# == Schema Information
#
# Table name: notices
#
#  id          :integer          not null, primary key
#  customer_id :integer
#  product_id  :integer
#  email       :string
#  state       :boolean
#  delete_at   :datetime
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

require 'test_helper'

class NoticeTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
