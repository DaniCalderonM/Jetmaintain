require "application_system_test_case"

class UpkeepsTest < ApplicationSystemTestCase
  setup do
    @upkeep = upkeeps(:one)
  end

  test "visiting the index" do
    visit upkeeps_url
    assert_selector "h1", text: "Upkeeps"
  end

  test "should create upkeep" do
    visit upkeeps_url
    click_on "New upkeep"

    fill_in "City", with: @upkeep.city_id
    fill_in "Date", with: @upkeep.date
    fill_in "Email", with: @upkeep.email
    fill_in "Engine", with: @upkeep.engine_id
    fill_in "Upkeeptipe", with: @upkeep.upkeeptipe_id
    click_on "Create Upkeep"

    assert_text "Upkeep was successfully created"
    click_on "Back"
  end

  test "should update Upkeep" do
    visit upkeep_url(@upkeep)
    click_on "Edit this upkeep", match: :first

    fill_in "City", with: @upkeep.city_id
    fill_in "Date", with: @upkeep.date
    fill_in "Email", with: @upkeep.email
    fill_in "Engine", with: @upkeep.engine_id
    fill_in "Upkeeptipe", with: @upkeep.upkeeptipe_id
    click_on "Update Upkeep"

    assert_text "Upkeep was successfully updated"
    click_on "Back"
  end

  test "should destroy Upkeep" do
    visit upkeep_url(@upkeep)
    click_on "Destroy this upkeep", match: :first

    assert_text "Upkeep was successfully destroyed"
  end
end
