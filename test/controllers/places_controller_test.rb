require 'test_helper'

class PlacesControllerTest < ActionDispatch::IntegrationTest
  test "should get businesses" do
    get places_businesses_url
    assert_response :success
  end

end
