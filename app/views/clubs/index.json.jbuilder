json.array!(@clubs) do |club|
  json.extract! club, :id, :name, :location, :picture, :description, :provider, :expires_on
  json.url club_url(club, format: :json)
end
