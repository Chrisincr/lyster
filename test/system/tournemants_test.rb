require "application_system_test_case"

class TournemantsTest < ApplicationSystemTestCase
  setup do
    @tournemant = tournemants(:one)
  end

  test "visiting the index" do
    visit tournemants_url
    assert_selector "h1", text: "Tournemants"
  end

  test "creating a Tournemant" do
    visit tournemants_url
    click_on "New Tournemant"

    fill_in "Description", with: @tournemant.description
    fill_in "Name", with: @tournemant.name
    fill_in "Start date", with: @tournemant.start_date
    fill_in "User", with: @tournemant.user_id
    click_on "Create Tournemant"

    assert_text "Tournemant was successfully created"
    click_on "Back"
  end

  test "updating a Tournemant" do
    visit tournemants_url
    click_on "Edit", match: :first

    fill_in "Description", with: @tournemant.description
    fill_in "Name", with: @tournemant.name
    fill_in "Start date", with: @tournemant.start_date
    fill_in "User", with: @tournemant.user_id
    click_on "Update Tournemant"

    assert_text "Tournemant was successfully updated"
    click_on "Back"
  end

  test "destroying a Tournemant" do
    visit tournemants_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Tournemant was successfully destroyed"
  end
end
