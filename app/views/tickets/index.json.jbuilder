json.array!(@tickets) do |ticket|
  json.extract! ticket, :id, :user_id, :header, :description
  json.url ticket_url(ticket, format: :json)
end
