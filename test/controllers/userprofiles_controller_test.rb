require "test_helper"

class UserprofilesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @userprofile = userprofiles(:one)
  end

  test "should get index" do
    get userprofiles_url
    assert_response :success
  end

  test "should get new" do
    get new_userprofile_url
    assert_response :success
  end

  test "should create userprofile" do
    assert_difference("Userprofile.count") do
      post userprofiles_url, params: { userprofile: { Address: @userprofile.Address, DOB: @userprofile.DOB, Gender: @userprofile.Gender, Occupation: @userprofile.Occupation, phoneNumber: @userprofile.phoneNumber, profilePic: @userprofile.profilePic, userEmail: @userprofile.userEmail, userName: @userprofile.userName } }
    end

    assert_redirected_to userprofile_url(Userprofile.last)
  end

  test "should show userprofile" do
    get userprofile_url(@userprofile)
    assert_response :success
  end

  test "should get edit" do
    get edit_userprofile_url(@userprofile)
    assert_response :success
  end

  test "should update userprofile" do
    patch userprofile_url(@userprofile), params: { userprofile: { Address: @userprofile.Address, DOB: @userprofile.DOB, Gender: @userprofile.Gender, Occupation: @userprofile.Occupation, phoneNumber: @userprofile.phoneNumber, profilePic: @userprofile.profilePic, userEmail: @userprofile.userEmail, userName: @userprofile.userName } }
    assert_redirected_to userprofile_url(@userprofile)
  end

  test "should destroy userprofile" do
    assert_difference("Userprofile.count", -1) do
      delete userprofile_url(@userprofile)
    end

    assert_redirected_to userprofiles_url
  end
end
