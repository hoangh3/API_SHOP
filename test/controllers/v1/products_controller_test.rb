require 'test_helper'

class V1::ProductsControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get v1_products_show_url
    assert_response :success
  end

end
