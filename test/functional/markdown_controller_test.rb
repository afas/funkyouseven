require 'test_helper'

class MarkdownControllerTest < ActionController::TestCase
  test "should get preview" do
    get :preview
    assert_response :success
  end

end
