require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end

  test "get#index" do
    get "/users"
    assert_equal 200, status
  end

  
end
