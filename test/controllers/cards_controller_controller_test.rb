require 'test_helper'

class CardsControllerControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get cards_controller_index_url
    assert_response :success
  end

  test "should get new" do
    get cards_controller_new_url
    assert_response :success
  end

  test "should get create" do
    get cards_controller_create_url
    assert_response :success
  end

  test "should get show" do
    get cards_controller_show_url
    assert_response :success
  end

  test "should get edit" do
    get cards_controller_edit_url
    assert_response :success
  end

  test "should get update" do
    get cards_controller_update_url
    assert_response :success
  end

  test "should get destroy" do
    get cards_controller_destroy_url
    assert_response :success
  end

end
