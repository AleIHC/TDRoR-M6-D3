require "test_helper"

class CcPostsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @cc_post = cc_posts(:one)
  end

  test "should get index" do
    get cc_posts_url
    assert_response :success
  end

  test "should get new" do
    get new_cc_post_url
    assert_response :success
  end

  test "should create cc_post" do
    assert_difference("CcPost.count") do
      post cc_posts_url, params: { cc_post: { cc_user_id: @cc_post.cc_user_id, content: @cc_post.content, image: @cc_post.image, title: @cc_post.title } }
    end

    assert_redirected_to cc_post_url(CcPost.last)
  end

  test "should show cc_post" do
    get cc_post_url(@cc_post)
    assert_response :success
  end

  test "should get edit" do
    get edit_cc_post_url(@cc_post)
    assert_response :success
  end

  test "should update cc_post" do
    patch cc_post_url(@cc_post), params: { cc_post: { cc_user_id: @cc_post.cc_user_id, content: @cc_post.content, image: @cc_post.image, title: @cc_post.title } }
    assert_redirected_to cc_post_url(@cc_post)
  end

  test "should destroy cc_post" do
    assert_difference("CcPost.count", -1) do
      delete cc_post_url(@cc_post)
    end

    assert_redirected_to cc_posts_url
  end
end
