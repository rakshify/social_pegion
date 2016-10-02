json.array!(@senders) do |sender|
  json.extract! sender, :id, :name, :phone_number, :email, :address, :send_from, :send_to, :send_date_range, :item_description
  json.url sender_url(sender, format: :json)
end
