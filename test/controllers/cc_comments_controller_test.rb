require "test_helper"

class CcCommentsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @cc_comment = cc_comments(:one)
  end

  test "should get index" do
    get cc_comments_url
    assert_response :success
  end

  test "should get new" do
    get new_cc_comment_url
    assert_response :success
  end

  test "should create cc_comment" do
    assert_difference("CcComment.count") do
      post cc_comments_url, params: { cc_comment: { cc_post_id: @cc_comment.cc_post_id, cc_user_id: @cc_comment.cc_user_id, content: @cc_comment.content } }
    end

    assert_redirected_to cc_comment_url(CcComment.last)
  end

  test "should show cc_comment" do
    get cc_comment_url(@cc_comment)
    assert_response :success
  end

  test "should get edit" do
    get edit_cc_comment_url(@cc_comment)
    assert_response :success
  end

  test "should update cc_comment" do
    patch cc_comment_url(@cc_comment), params: { cc_comment: { cc_post_id: @cc_comment.cc_post_id, cc_user_id: @cc_comment.cc_user_id, content: @cc_comment.content } }
    assert_redirected_to cc_comment_url(@cc_comment)
  end

  test "should destroy cc_comment" do
    assert_difference("CcComment.count", -1) do
      delete cc_comment_url(@cc_comment)
    end

    assert_redirected_to cc_comments_url
  end
end
