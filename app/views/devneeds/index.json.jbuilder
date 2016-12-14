json.array!(@devneeds) do |devneed|
  json.extract! devneed, :id, :title, :description
  json.url devneed_url(devneed, format: :json)
end
