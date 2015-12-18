json.array!(@customers) do |customer|
  json.extract! customer, :id, :user_id, :name, :zipcode, :street_address, :city, :phone
  json.url customer_url(customer, format: :json)
end
