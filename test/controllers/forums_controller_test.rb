require 'test_helper'

class ForumsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get forums_index_url
    assert_response :success
  end

  test "should get show" do
    get forums_show_url
    assert_response :success
  end

  test "should get edit" do
    get forums_edit_url
    assert_response :success
  end

  test "should get update" do
    get forums_update_url
    assert_response :success
  end

end
