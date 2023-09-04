json.extract! cc_comment, :id, :content, :cc_user_id, :cc_post_id, :created_at, :updated_at
json.url cc_comment_url(cc_comment, format: :json)
