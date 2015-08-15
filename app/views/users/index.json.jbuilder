json.array!(@users) do |user|
  json.extract! user, :id, :email, :name, :level
  json.url user_url(user, format: :json)
end
