require 'test_helper'

class JoinControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get join_create_url
    assert_response :success
  end

  test "should get destroy" do
    get join_destroy_url
    assert_response :success
  end

end
