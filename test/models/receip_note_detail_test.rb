# == Schema Information
#
# Table name: receip_note_details
#
#  id             :integer          not null, primary key
#  receip_note_id :integer
#  product_id     :integer
#  quantity       :integer
#  price          :float
#  delete_at      :datetime
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#

require 'test_helper'

class ReceipNoteDetailTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
