require 'test_helper'

class PostVotesControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get post_votes_create_url
    assert_response :success
  end

  test "should get delete" do
    get post_votes_delete_url
    assert_response :success
  end

end
