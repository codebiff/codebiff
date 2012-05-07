require 'test_helper'

class PagesControllerTest < ActionController::TestCase
  test "should get archive" do
    get :archive
    assert_response :success
  end

end
