require 'test_helper'

class SectionCategoriesControllerTest < ActionController::TestCase
  setup do
    @section_category = section_categories(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:section_categories)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create section_category" do
    assert_difference('SectionCategory.count') do
      post :create, section_category: { description: @section_category.description, name: @section_category.name, section_id: @section_category.section_id }
    end

    assert_redirected_to section_category_path(assigns(:section_category))
  end

  test "should show section_category" do
    get :show, id: @section_category
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @section_category
    assert_response :success
  end

  test "should update section_category" do
    put :update, id: @section_category, section_category: { description: @section_category.description, name: @section_category.name, section_id: @section_category.section_id }
    assert_redirected_to section_category_path(assigns(:section_category))
  end

  test "should destroy section_category" do
    assert_difference('SectionCategory.count', -1) do
      delete :destroy, id: @section_category
    end

    assert_redirected_to section_categories_path
  end
end
