require "application_system_test_case"

class PointsHistoriesTest < ApplicationSystemTestCase
  setup do
    @points_history = points_histories(:one)
  end

  test "visiting the index" do
    visit points_histories_url
    assert_selector "h1", text: "Points histories"
  end

  test "should create points history" do
    visit points_histories_url
    click_on "New points history"

    fill_in "A coins", with: @points_history.A_coins
    fill_in "Add type logo", with: @points_history.Add_type_logo
    fill_in "Scheme name", with: @points_history.Scheme_Name
    click_on "Create Points history"

    assert_text "Points history was successfully created"
    click_on "Back"
  end

  test "should update Points history" do
    visit points_history_url(@points_history)
    click_on "Edit this points history", match: :first

    fill_in "A coins", with: @points_history.A_coins
    fill_in "Add type logo", with: @points_history.Add_type_logo
    fill_in "Scheme name", with: @points_history.Scheme_Name
    click_on "Update Points history"

    assert_text "Points history was successfully updated"
    click_on "Back"
  end

  test "should destroy Points history" do
    visit points_history_url(@points_history)
    click_on "Destroy this points history", match: :first

    assert_text "Points history was successfully destroyed"
  end
end
