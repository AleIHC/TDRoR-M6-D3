require "application_system_test_case"

class CcCommentsTest < ApplicationSystemTestCase
  setup do
    @cc_comment = cc_comments(:one)
  end

  test "visiting the index" do
    visit cc_comments_url
    assert_selector "h1", text: "Cc comments"
  end

  test "should create cc comment" do
    visit cc_comments_url
    click_on "New cc comment"

    fill_in "Cc post", with: @cc_comment.cc_post_id
    fill_in "Cc user", with: @cc_comment.cc_user_id
    fill_in "Content", with: @cc_comment.content
    click_on "Create Cc comment"

    assert_text "Cc comment was successfully created"
    click_on "Back"
  end

  test "should update Cc comment" do
    visit cc_comment_url(@cc_comment)
    click_on "Edit this cc comment", match: :first

    fill_in "Cc post", with: @cc_comment.cc_post_id
    fill_in "Cc user", with: @cc_comment.cc_user_id
    fill_in "Content", with: @cc_comment.content
    click_on "Update Cc comment"

    assert_text "Cc comment was successfully updated"
    click_on "Back"
  end

  test "should destroy Cc comment" do
    visit cc_comment_url(@cc_comment)
    click_on "Destroy this cc comment", match: :first

    assert_text "Cc comment was successfully destroyed"
  end
end
