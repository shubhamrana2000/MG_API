require "application_system_test_case"

class FantasiesTest < ApplicationSystemTestCase
  setup do
    @fantasy = fantasies(:one)
  end

  test "visiting the index" do
    visit fantasies_url
    assert_selector "h1", text: "Fantasies"
  end

  test "should create fantasy" do
    visit fantasies_url
    click_on "New fantasy"

    fill_in "Logo", with: @fantasy.Logo
    fill_in "Min withdrawl", with: @fantasy.Min_withdrawl
    fill_in "Refferalcode", with: @fantasy.RefferalCode
    fill_in "Tasklink", with: @fantasy.TaskLink
    fill_in "Title", with: @fantasy.Title
    fill_in "Withdrawltype", with: @fantasy.WithdrawlType
    fill_in "Signupbonus", with: @fantasy.signupBonus
    click_on "Create Fantasy"

    assert_text "Fantasy was successfully created"
    click_on "Back"
  end

  test "should update Fantasy" do
    visit fantasy_url(@fantasy)
    click_on "Edit this fantasy", match: :first

    fill_in "Logo", with: @fantasy.Logo
    fill_in "Min withdrawl", with: @fantasy.Min_withdrawl
    fill_in "Refferalcode", with: @fantasy.RefferalCode
    fill_in "Tasklink", with: @fantasy.TaskLink
    fill_in "Title", with: @fantasy.Title
    fill_in "Withdrawltype", with: @fantasy.WithdrawlType
    fill_in "Signupbonus", with: @fantasy.signupBonus
    click_on "Update Fantasy"

    assert_text "Fantasy was successfully updated"
    click_on "Back"
  end

  test "should destroy Fantasy" do
    visit fantasy_url(@fantasy)
    click_on "Destroy this fantasy", match: :first

    assert_text "Fantasy was successfully destroyed"
  end
end
