require 'test_helper'

class Admins::FavoritesControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get admins_favorites_show_url
    assert_response :success
  end

end
