require 'test_helper'

class StaticPagesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @static_page = static_pages(:one)
  end

  test "should get index" do
    get static_pages_url
    assert_response :success
  end

  test "should get new" do
    get new_static_page_url
    assert_response :success
  end

  test "should create static_page" do
    assert_difference('StaticPage.count') do
      post static_pages_url, params: { static_page: {  } }
    end

    assert_redirected_to static_page_url(StaticPage.last)
  end

  test "should show static_page" do
    get static_page_url(@static_page)
    assert_response :success
  end

  test "should get edit" do
    get edit_static_page_url(@static_page)
    assert_response :success
  end

  test "should update static_page" do
    patch static_page_url(@static_page), params: { static_page: {  } }
    assert_redirected_to static_page_url(@static_page)
  end

  test "should destroy static_page" do
    assert_difference('StaticPage.count', -1) do
      delete static_page_url(@static_page)
    end

    assert_redirected_to static_pages_url
  end
end
