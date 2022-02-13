require "test_helper"

class SchejulesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get schejules_index_url
    assert_response :success
  end
end
