json.array!(@states_assigns) do |states_assign|
  json.extract! states_assign, :id, :state_id, :assigned_to
  json.url states_assign_url(states_assign, format: :json)
end
