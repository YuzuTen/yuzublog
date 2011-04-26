require 'test_helper'
require 'devise/test_helpers'

class PostsControllerTest < ActionController::TestCase
  include Devise::TestHelpers

  setup do
    @post = posts(:one)
    @blog = blogs(:one)
    sign_in users(:one)
  end

  test "should get index" do
    
    get :index, :blog_id => @blog.id
    assert_response :success
    assert_not_nil assigns(:posts)
  end

  test "should get new" do
    get :new, :blog_id => @blog.id 
    assert_response :success
  end

  test "should create post" do
    assert_difference('Post.count') do
      post :create, :post => @post.attributes, :blog_id => @blog.blog_id
    end

    assert_redirected_to blog_post_path(assigns(:post), :blog_id => @post.blog_id)
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
