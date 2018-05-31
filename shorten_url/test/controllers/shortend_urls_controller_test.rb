require 'test_helper'

class ShortendUrlsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @shortend_url = shortend_urls(:one)
  end

  test "should get index" do
    get shortend_urls_url
    assert_response :success
  end

  test "should get new" do
    get new_shortend_url_url
    assert_response :success
  end

  test "should create shortend_url" do
    assert_difference('ShortendUrl.count') do
      post shortend_urls_url, params: { shortend_url: { original_url: @shortend_url.original_url, short_url: @shortend_url.short_url } }
    end

    assert_redirected_to shortend_url_url(ShortendUrl.last)
  end

  test "should show shortend_url" do
    get shortend_url_url(@shortend_url)
    assert_response :success
  end

  test "should get edit" do
    get edit_shortend_url_url(@shortend_url)
    assert_response :success
  end

  test "should update shortend_url" do
    patch shortend_url_url(@shortend_url), params: { shortend_url: { original_url: @shortend_url.original_url, short_url: @shortend_url.short_url } }
    assert_redirected_to shortend_url_url(@shortend_url)
  end

  test "should destroy shortend_url" do
    assert_difference('ShortendUrl.count', -1) do
      delete shortend_url_url(@shortend_url)
    end

    assert_redirected_to shortend_urls_url
  end
end
