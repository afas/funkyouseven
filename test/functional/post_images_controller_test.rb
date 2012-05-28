require 'test_helper'

class PostImagesControllerTest < ActionController::TestCase
  setup do
    @post_image = post_images(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:post_images)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create post_image" do
    assert_difference('PostImage.count') do
      post :create, post_image: { cover: @post_image.cover, image_content_type: @post_image.image_content_type, image_file_name: @post_image.image_file_name, image_file_size: @post_image.image_file_size, post_id: @post_image.post_id, title: @post_image.title }
    end

    assert_redirected_to post_image_path(assigns(:post_image))
  end

  test "should show post_image" do
    get :show, id: @post_image
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @post_image
    assert_response :success
  end

  test "should update post_image" do
    put :update, id: @post_image, post_image: { cover: @post_image.cover, image_content_type: @post_image.image_content_type, image_file_name: @post_image.image_file_name, image_file_size: @post_image.image_file_size, post_id: @post_image.post_id, title: @post_image.title }
    assert_redirected_to post_image_path(assigns(:post_image))
  end

  test "should destroy post_image" do
    assert_difference('PostImage.count', -1) do
      delete :destroy, id: @post_image
    end

    assert_redirected_to post_images_path
  end
end
