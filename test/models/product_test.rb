# == Schema Information
#
# Table name: products
#
#  id                :integer          not null, primary key
#  category_id       :integer
#  producer_id       :integer
#  sex_id            :integer
#  name              :string
#  price             :float
#  quantity          :integer
#  cash_discount     :integer
#  image             :string
#  title             :string
#  color             :string
#  size              :string
#  designed          :string
#  content           :string
#  order_information :string
#  delete_at         :datetime
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#

require 'test_helper'

class ProductTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
