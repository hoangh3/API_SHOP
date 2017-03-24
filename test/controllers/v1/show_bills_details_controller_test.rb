require 'test_helper'

class V1::ShowBillsDetailsControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get v1_show_bills_details_create_url
    assert_response :success
  end

end
