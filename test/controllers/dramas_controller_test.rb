require "test_helper"

class DramasControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get dramas_index_url
    assert_response :success
  end
end
