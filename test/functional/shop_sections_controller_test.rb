require 'test_helper'

class ShopSectionsControllerTest < ActionController::TestCase
  setup do
    @shop_section = shop_sections(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:shop_sections)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create shop_section" do
    assert_difference('ShopSection.count') do
      post :create, shop_section: { description: @shop_section.description, name: @shop_section.name, short_url: @shop_section.short_url }
    end

    assert_redirected_to shop_section_path(assigns(:shop_section))
  end

  test "should show shop_section" do
    get :show, id: @shop_section
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @shop_section
    assert_response :success
  end

  test "should update shop_section" do
    put :update, id: @shop_section, shop_section: { description: @shop_section.description, name: @shop_section.name, short_url: @shop_section.short_url }
    assert_redirected_to shop_section_path(assigns(:shop_section))
  end

  test "should destroy shop_section" do
    assert_difference('ShopSection.count', -1) do
      delete :destroy, id: @shop_section
    end

    assert_redirected_to shop_sections_path
  end
end
