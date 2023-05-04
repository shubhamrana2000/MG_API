require "test_helper"

class WithdrawlHistoriesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @withdrawl_history = withdrawl_histories(:one)
  end

  test "should get index" do
    get withdrawl_histories_url
    assert_response :success
  end

  test "should get new" do
    get new_withdrawl_history_url
    assert_response :success
  end

  test "should create withdrawl_history" do
    assert_difference("WithdrawlHistory.count") do
      post withdrawl_histories_url, params: { withdrawl_history: { Trans_type_logo: @withdrawl_history.Trans_type_logo, Transaction_ID: @withdrawl_history.Transaction_ID, transaction_type: @withdrawl_history.transaction_type, w_coins: @withdrawl_history.w_coins } }
    end

    assert_redirected_to withdrawl_history_url(WithdrawlHistory.last)
  end

  test "should show withdrawl_history" do
    get withdrawl_history_url(@withdrawl_history)
    assert_response :success
  end

  test "should get edit" do
    get edit_withdrawl_history_url(@withdrawl_history)
    assert_response :success
  end

  test "should update withdrawl_history" do
    patch withdrawl_history_url(@withdrawl_history), params: { withdrawl_history: { Trans_type_logo: @withdrawl_history.Trans_type_logo, Transaction_ID: @withdrawl_history.Transaction_ID, transaction_type: @withdrawl_history.transaction_type, w_coins: @withdrawl_history.w_coins } }
    assert_redirected_to withdrawl_history_url(@withdrawl_history)
  end

  test "should destroy withdrawl_history" do
    assert_difference("WithdrawlHistory.count", -1) do
      delete withdrawl_history_url(@withdrawl_history)
    end

    assert_redirected_to withdrawl_histories_url
  end
end
