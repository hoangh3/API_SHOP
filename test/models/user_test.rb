# == Schema Information
#
# Table name: users
#
#  id                :integer          not null, primary key
#  customer_id       :integer
#  name              :string
#  email             :string
#  password_digest   :string
#  remember_digest   :string
#  activation_digest :string
#  activated         :boolean
#  activated_at      :string
#  datetime          :string
#  reset_digest      :string
#  reset_sent_at     :datetime
#  delete_at         :datetime
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#

require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
