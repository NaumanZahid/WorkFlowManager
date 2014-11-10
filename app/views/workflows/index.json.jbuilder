json.array!(@workflows) do |workflow|
  json.extract! workflow, :id, :active
  json.url workflow_url(workflow, format: :json)
end
