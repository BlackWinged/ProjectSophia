require 'test_helper'

class PhotowordsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @photoword = photowords(:one)
  end

  test "should get index" do
    get photowords_url
    assert_response :success
  end

  test "should get new" do
    get new_photoword_url
    assert_response :success
  end

  test "should create photoword" do
    assert_difference('Photoword.count') do
      post photowords_url, params: { photoword: { caption: @photoword.caption, path: @photoword.path } }
    end

    assert_redirected_to photoword_url(Photoword.last)
  end

  test "should show photoword" do
    get photoword_url(@photoword)
    assert_response :success
  end

  test "should get edit" do
    get edit_photoword_url(@photoword)
    assert_response :success
  end

  test "should update photoword" do
    patch photoword_url(@photoword), params: { photoword: { caption: @photoword.caption, path: @photoword.path } }
    assert_redirected_to photoword_url(@photoword)
  end

  test "should destroy photoword" do
    assert_difference('Photoword.count', -1) do
      delete photoword_url(@photoword)
    end

    assert_redirected_to photowords_url
  end
end
