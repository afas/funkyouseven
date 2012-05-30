require 'test_helper'

class ProductsControllerTest < ActionController::TestCase
  setup do
    @product = products(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:products)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create product" do
    assert_difference('Product.count') do
      post :create, product: { brand_id: @product.brand_id, career_id: @product.career_id, category_id: @product.category_id, color: @product.color, composition: @product.composition, description: @product.description, look_id: @product.look_id, price: @product.price, season: @product.season, sex_id: @product.sex_id, shop_section_id: @product.shop_section_id, title: @product.title, welcome_position_id: @product.welcome_position_id }
    end

    assert_redirected_to product_path(assigns(:product))
  end

  test "should show product" do
    get :show, id: @product
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @product
    assert_response :success
  end

  test "should update product" do
    put :update, id: @product, product: { brand_id: @product.brand_id, career_id: @product.career_id, category_id: @product.category_id, color: @product.color, composition: @product.composition, description: @product.description, look_id: @product.look_id, price: @product.price, season: @product.season, sex_id: @product.sex_id, shop_section_id: @product.shop_section_id, title: @product.title, welcome_position_id: @product.welcome_position_id }
    assert_redirected_to product_path(assigns(:product))
  end

  test "should destroy product" do
    assert_difference('Product.count', -1) do
      delete :destroy, id: @product
    end

    assert_redirected_to products_path
  end
end
