require "application_system_test_case"

class WithdrawlHistoriesTest < ApplicationSystemTestCase
  setup do
    @withdrawl_history = withdrawl_histories(:one)
  end

  test "visiting the index" do
    visit withdrawl_histories_url
    assert_selector "h1", text: "Withdrawl histories"
  end

  test "should create withdrawl history" do
    visit withdrawl_histories_url
    click_on "New withdrawl history"

    fill_in "Trans type logo", with: @withdrawl_history.Trans_type_logo
    fill_in "Transaction id", with: @withdrawl_history.Transaction_ID
    fill_in "Transaction type", with: @withdrawl_history.transaction_type
    fill_in "W coins", with: @withdrawl_history.w_coins
    click_on "Create Withdrawl history"

    assert_text "Withdrawl history was successfully created"
    click_on "Back"
  end

  test "should update Withdrawl history" do
    visit withdrawl_history_url(@withdrawl_history)
    click_on "Edit this withdrawl history", match: :first

    fill_in "Trans type logo", with: @withdrawl_history.Trans_type_logo
    fill_in "Transaction id", with: @withdrawl_history.Transaction_ID
    fill_in "Transaction type", with: @withdrawl_history.transaction_type
    fill_in "W coins", with: @withdrawl_history.w_coins
    click_on "Update Withdrawl history"

    assert_text "Withdrawl history was successfully updated"
    click_on "Back"
  end

  test "should destroy Withdrawl history" do
    visit withdrawl_history_url(@withdrawl_history)
    click_on "Destroy this withdrawl history", match: :first

    assert_text "Withdrawl history was successfully destroyed"
  end
end
