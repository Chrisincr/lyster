require 'test_helper'

class TournemantsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @tournemant = tournemants(:one)
  end

  test "should get index" do
    get tournemants_url
    assert_response :success
  end

  test "should get new" do
    get new_tournemant_url
    assert_response :success
  end

  test "should create tournemant" do
    assert_difference('Tournemant.count') do
      post tournemants_url, params: { tournemant: { description: @tournemant.description, name: @tournemant.name, start_date: @tournemant.start_date, user_id: @tournemant.user_id } }
    end

    assert_redirected_to tournemant_url(Tournemant.last)
  end

  test "should show tournemant" do
    get tournemant_url(@tournemant)
    assert_response :success
  end

  test "should get edit" do
    get edit_tournemant_url(@tournemant)
    assert_response :success
  end

  test "should update tournemant" do
    patch tournemant_url(@tournemant), params: { tournemant: { description: @tournemant.description, name: @tournemant.name, start_date: @tournemant.start_date, user_id: @tournemant.user_id } }
    assert_redirected_to tournemant_url(@tournemant)
  end

  test "should destroy tournemant" do
    assert_difference('Tournemant.count', -1) do
      delete tournemant_url(@tournemant)
    end

    assert_redirected_to tournemants_url
  end
end
