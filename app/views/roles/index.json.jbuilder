json.array!(@roles) do |role|
  json.extract! role, :id, :ename, :jname
  json.url role_url(role, format: :json)
end
