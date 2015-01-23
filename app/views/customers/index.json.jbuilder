json.array!(@customers) do |customer|
  json.extract! customer, :id, :name, :phone, :date_of_birth, :email, :picture, :deal_id, :event_id
  json.url customer_url(customer, format: :json)
end
