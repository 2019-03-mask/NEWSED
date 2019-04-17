require 'test_helper'

class LableControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get lable_index_url
    assert_response :success
  end

end
