json.array!(@payments) do |payment|
  json.extract! payment, :id, :cash
  json.url payment_url(payment, format: :json)
end
