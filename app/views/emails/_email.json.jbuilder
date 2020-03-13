json.extract! email, :id, :title, :receiver_id, :content, :user, :created_at, :updated_at
json.url email_url(email, format: :json)
