require "application_system_test_case"

class UserprofilesTest < ApplicationSystemTestCase
  setup do
    @userprofile = userprofiles(:one)
  end

  test "visiting the index" do
    visit userprofiles_url
    assert_selector "h1", text: "Userprofiles"
  end

  test "should create userprofile" do
    visit userprofiles_url
    click_on "New userprofile"

    fill_in "Address", with: @userprofile.Address
    fill_in "Dob", with: @userprofile.DOB
    fill_in "Gender", with: @userprofile.Gender
    fill_in "Occupation", with: @userprofile.Occupation
    fill_in "Phonenumber", with: @userprofile.phoneNumber
    fill_in "Profilepic", with: @userprofile.profilePic
    fill_in "Useremail", with: @userprofile.userEmail
    fill_in "Username", with: @userprofile.userName
    click_on "Create Userprofile"

    assert_text "Userprofile was successfully created"
    click_on "Back"
  end

  test "should update Userprofile" do
    visit userprofile_url(@userprofile)
    click_on "Edit this userprofile", match: :first

    fill_in "Address", with: @userprofile.Address
    fill_in "Dob", with: @userprofile.DOB
    fill_in "Gender", with: @userprofile.Gender
    fill_in "Occupation", with: @userprofile.Occupation
    fill_in "Phonenumber", with: @userprofile.phoneNumber
    fill_in "Profilepic", with: @userprofile.profilePic
    fill_in "Useremail", with: @userprofile.userEmail
    fill_in "Username", with: @userprofile.userName
    click_on "Update Userprofile"

    assert_text "Userprofile was successfully updated"
    click_on "Back"
  end

  test "should destroy Userprofile" do
    visit userprofile_url(@userprofile)
    click_on "Destroy this userprofile", match: :first

    assert_text "Userprofile was successfully destroyed"
  end
end
