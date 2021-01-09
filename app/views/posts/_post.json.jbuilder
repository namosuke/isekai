json.extract! post, :id, :content, :user_id, :village_id, :job_id, :created_at, :updated_at
json.url post_url(post, format: :json)
