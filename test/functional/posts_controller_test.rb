require 'test_helper'
require 'devise/test_helpers'

class PostsControllerTest < ActionController::TestCase
  include Devise::TestHelpers

  setup do
    @post = posts(:one)
    @blog = blogs(:one)
    @request.host=@blog.site.hostname
    sign_in users(:one)
  end

  test "should get index" do
    
    get :index
    assert_response :success
    assert_not_nil assigns(:posts)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create post" do
    assert_difference('Post.count') do
      post :create, :post => @post.attributes
    end

    assert_redirected_to post_path(assigns(:post))
  end

  test "should show post" do
    get :show, :id => @post.to_param, :blog_id => @post.blog_id
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @post.to_param, :blog_id => @post.blog_id
    assert_response :success
  end

  # test "should update post" do
  #   put :update, :id => @post.to_param, , :blog_id => @post.blog.to_param, :post => @post.attributes
  #   assert_redirected_to post_path(assigns(:post))
  # end

  test "should destroy post" do
    assert_difference('Post.count', -1) do
      delete :destroy, :id => @post.to_param, :blog_id => @post.blog_id
    end

    assert_redirected_to posts_path
  end
end
