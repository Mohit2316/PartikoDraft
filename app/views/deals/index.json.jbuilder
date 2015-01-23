json.array!(@deals) do |deal|
  json.extract! deal, :id, :name, :location, :picture, :description, :provider, :expires_on
  json.url deal_url(deal, format: :json)
end
