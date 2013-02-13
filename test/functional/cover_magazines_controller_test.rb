require 'test_helper'

class CoverMagazinesControllerTest < ActionController::TestCase
  setup do
    @cover_magazine = cover_magazines(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:cover_magazines)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create cover_magazine" do
    assert_difference('CoverMagazine.count') do
      post :create, cover_magazine: { columns: @cover_magazine.columns, columns_html_data: @cover_magazine.columns_html_data, cover_css: @cover_magazine.cover_css, cover_html: @cover_magazine.cover_html, cover_js: @cover_magazine.cover_js, release_date: @cover_magazine.release_date, sequence_number: @cover_magazine.sequence_number, special: @cover_magazine.special, special_html_data: @cover_magazine.special_html_data, subject: @cover_magazine.subject, subject_html_data: @cover_magazine.subject_html_data, title: @cover_magazine.title, title_html_data: @cover_magazine.title_html_data, year_number: @cover_magazine.year_number }
    end

    assert_redirected_to cover_magazine_path(assigns(:cover_magazine))
  end

  test "should show cover_magazine" do
    get :show, id: @cover_magazine
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @cover_magazine
    assert_response :success
  end

  test "should update cover_magazine" do
    put :update, id: @cover_magazine, cover_magazine: { columns: @cover_magazine.columns, columns_html_data: @cover_magazine.columns_html_data, cover_css: @cover_magazine.cover_css, cover_html: @cover_magazine.cover_html, cover_js: @cover_magazine.cover_js, release_date: @cover_magazine.release_date, sequence_number: @cover_magazine.sequence_number, special: @cover_magazine.special, special_html_data: @cover_magazine.special_html_data, subject: @cover_magazine.subject, subject_html_data: @cover_magazine.subject_html_data, title: @cover_magazine.title, title_html_data: @cover_magazine.title_html_data, year_number: @cover_magazine.year_number }
    assert_redirected_to cover_magazine_path(assigns(:cover_magazine))
  end

  test "should destroy cover_magazine" do
    assert_difference('CoverMagazine.count', -1) do
      delete :destroy, id: @cover_magazine
    end

    assert_redirected_to cover_magazines_path
  end
end
