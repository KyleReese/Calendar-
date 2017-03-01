require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end

  test "get#index" do
    get "/users"
    assert_equal 200, status
  end

  test "get#show_found" do
    get "/users/1"
    assert_equal 200, status
  end

  test "get#show_not_found" do
    assert_raises(ActiveRecord::RecordNotFound){ get "/users/3" }
  end

  test "delete#destroy_exists" do
    delete "/users/1"
    assert_equal 302, status
  end

  test "delete#destroy_doesnt_exist" do
    assert_raises(ActiveRecord::RecordNotFound){ delete "/users/3" }
  end
end
