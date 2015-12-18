json.array!(@order_statuses) do |order_status|
  json.extract! order_status, :id, :s, :c
  json.url order_status_url(order_status, format: :json)
end
