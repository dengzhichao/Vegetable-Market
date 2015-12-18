json.array!(@order_items) do |order_item|
  json.extract! order_item, :id, :order_id, :merchandise_id, :price, :number_of_items
  json.url order_item_url(order_item, format: :json)
end
