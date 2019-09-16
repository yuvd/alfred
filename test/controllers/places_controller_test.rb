require 'test_helper'

class PlacesControllerTest < ActionDispatch::IntegrationTest

  test "should get index" do
    get places_index_url
    assert_response :success
  end

  test "should get show" do
    get places_show_url


  # test "the truth" do
  #   assert true
  # end
  #is this breaking stuff?
  
  test "should get businesses" do
    get places_businesses_url

    assert_response :success
  end

end
