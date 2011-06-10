require 'test_helper'

class HomeControllerTest < ActionController::TestCase
  setup do
    @blog = blogs(:one)
    @request.host=@blog.site.hostname
  end

  test "should get index" do
    get :index, {:blog_id => @blog.id }
    assert_response :success
  end

  test "should get about" do
    get :about,  {:blog_id => @blog.id }

    assert_response :success
  end

  test "should get contact" do
    get :contact,  {:blog_id => @blog.id }

    assert_response :success
  end

end
