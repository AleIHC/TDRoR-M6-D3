json.extract! cc_post, :id, :image, :title, :content, :cc_user_id, :created_at, :updated_at
json.url cc_post_url(cc_post, format: :json)
