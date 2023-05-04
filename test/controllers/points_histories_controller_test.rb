require "test_helper"

class PointsHistoriesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @points_history = points_histories(:one)
  end

  test "should get index" do
    get points_histories_url
    assert_response :success
  end

  test "should get new" do
    get new_points_history_url
    assert_response :success
  end

  test "should create points_history" do
    assert_difference("PointsHistory.count") do
      post points_histories_url, params: { points_history: { A_coins: @points_history.A_coins, Add_type_logo: @points_history.Add_type_logo, Scheme_Name: @points_history.Scheme_Name } }
    end

    assert_redirected_to points_history_url(PointsHistory.last)
  end

  test "should show points_history" do
    get points_history_url(@points_history)
    assert_response :success
  end

  test "should get edit" do
    get edit_points_history_url(@points_history)
    assert_response :success
  end

  test "should update points_history" do
    patch points_history_url(@points_history), params: { points_history: { A_coins: @points_history.A_coins, Add_type_logo: @points_history.Add_type_logo, Scheme_Name: @points_history.Scheme_Name } }
    assert_redirected_to points_history_url(@points_history)
  end

  test "should destroy points_history" do
    assert_difference("PointsHistory.count", -1) do
      delete points_history_url(@points_history)
    end

    assert_redirected_to points_histories_url
  end
end
