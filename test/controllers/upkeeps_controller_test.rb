require "test_helper"

class UpkeepsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @upkeep = upkeeps(:one)
  end

  test "should get index" do
    get upkeeps_url
    assert_response :success
  end

  test "should get new" do
    get new_upkeep_url
    assert_response :success
  end

  test "should create upkeep" do
    assert_difference("Upkeep.count") do
      post upkeeps_url, params: { upkeep: { city_id: @upkeep.city_id, date: @upkeep.date, email: @upkeep.email, engine_id: @upkeep.engine_id, upkeeptipe_id: @upkeep.upkeeptipe_id } }
    end

    assert_redirected_to upkeep_url(Upkeep.last)
  end

  test "should show upkeep" do
    get upkeep_url(@upkeep)
    assert_response :success
  end

  test "should get edit" do
    get edit_upkeep_url(@upkeep)
    assert_response :success
  end

  test "should update upkeep" do
    patch upkeep_url(@upkeep), params: { upkeep: { city_id: @upkeep.city_id, date: @upkeep.date, email: @upkeep.email, engine_id: @upkeep.engine_id, upkeeptipe_id: @upkeep.upkeeptipe_id } }
    assert_redirected_to upkeep_url(@upkeep)
  end

  test "should destroy upkeep" do
    assert_difference("Upkeep.count", -1) do
      delete upkeep_url(@upkeep)
    end

    assert_redirected_to upkeeps_url
  end
end
