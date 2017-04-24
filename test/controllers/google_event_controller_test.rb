require 'test_helper'

class GoogleEventControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get google_event_index_url
    assert_response :success
  end

end
