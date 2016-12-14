json.array!(@comments) do |comment|
  json.extract! comment, :id, :devneed_id, :body, :user
  json.url comment_url(comment, format: :json)
end
