require 'test_helper'

class PayCardsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get pay_cards_new_url
    assert_response :success
  end

end
