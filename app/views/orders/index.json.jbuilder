json.array!(@orders) do |order|
  json.extract! order, :id, :customer_id, :order_status_id, :shipped_at, :traceable_number
  json.url order_url(order, format: :json)
end
