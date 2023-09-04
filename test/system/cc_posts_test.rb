require "application_system_test_case"

class CcPostsTest < ApplicationSystemTestCase
  setup do
    @cc_post = cc_posts(:one)
  end

  test "visiting the index" do
    visit cc_posts_url
    assert_selector "h1", text: "Cc posts"
  end

  test "should create cc post" do
    visit cc_posts_url
    click_on "New cc post"

    fill_in "Cc user", with: @cc_post.cc_user_id
    fill_in "Content", with: @cc_post.content
    fill_in "Image", with: @cc_post.image
    fill_in "Title", with: @cc_post.title
    click_on "Create Cc post"

    assert_text "Cc post was successfully created"
    click_on "Back"
  end

  test "should update Cc post" do
    visit cc_post_url(@cc_post)
    click_on "Edit this cc post", match: :first

    fill_in "Cc user", with: @cc_post.cc_user_id
    fill_in "Content", with: @cc_post.content
    fill_in "Image", with: @cc_post.image
    fill_in "Title", with: @cc_post.title
    click_on "Update Cc post"

    assert_text "Cc post was successfully updated"
    click_on "Back"
  end

  test "should destroy Cc post" do
    visit cc_post_url(@cc_post)
    click_on "Destroy this cc post", match: :first

    assert_text "Cc post was successfully destroyed"
  end
end
