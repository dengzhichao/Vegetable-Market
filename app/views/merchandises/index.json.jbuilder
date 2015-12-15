json.array!(@merchandises) do |merchandise|
  json.extract! merchandise, :id, :category, :name, :price, :max_order
  json.url merchandise_url(merchandise, format: :json)
end
