json.array!(@statuses) do |status|
  json.extract! status, :id, :name, :order_num
  json.url status_url(status, format: :json)
end
