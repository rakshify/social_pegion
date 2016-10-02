json.array!(@travellers) do |traveller|
  json.extract! traveller, :id, :name, :phone_number, :email, :address, :travelling_from, :travelling_to, :travel_date, :conditions
  json.url traveller_url(traveller, format: :json)
end
