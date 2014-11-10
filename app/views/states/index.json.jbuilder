json.array!(@states) do |state|
  json.extract! state, :id, :type, :name
  json.url state_url(state, format: :json)
end
