require "test_helper"

class RelationshipsControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get relationships_create_url
    assert_response :success
  end

  test "should get destoy" do
    get relationships_destoy_url
    assert_response :success
  end
end
