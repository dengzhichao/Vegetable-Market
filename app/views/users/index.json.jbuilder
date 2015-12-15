json.array!(@users) do |user|
  json.extract! user, :id, :email, :role_id, :handle
  json.url user_url(user, format: :json)
end
