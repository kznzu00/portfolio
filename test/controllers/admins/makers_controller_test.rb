require 'test_helper'

class Admins::MakersControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admins_makers_index_url
    assert_response :success
  end

end
