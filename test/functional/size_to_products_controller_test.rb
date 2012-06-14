require 'test_helper'

class SizeToProductsControllerTest < ActionController::TestCase
  setup do
    @size_to_product = size_to_products(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:size_to_products)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create size_to_product" do
    assert_difference('SizeToProduct.count') do
      post :create, size_to_product: { product_id: @size_to_product.product_id, size_id: @size_to_product.size_id }
    end

    assert_redirected_to size_to_product_path(assigns(:size_to_product))
  end

  test "should show size_to_product" do
    get :show, id: @size_to_product
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @size_to_product
    assert_response :success
  end

  test "should update size_to_product" do
    put :update, id: @size_to_product, size_to_product: { product_id: @size_to_product.product_id, size_id: @size_to_product.size_id }
    assert_redirected_to size_to_product_path(assigns(:size_to_product))
  end

  test "should destroy size_to_product" do
    assert_difference('SizeToProduct.count', -1) do
      delete :destroy, id: @size_to_product
    end

    assert_redirected_to size_to_products_path
  end
end
