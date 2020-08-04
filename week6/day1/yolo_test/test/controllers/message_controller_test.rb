require 'test_helper'

class MessageControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get message_show_url
    assert_response :success
  end

end
