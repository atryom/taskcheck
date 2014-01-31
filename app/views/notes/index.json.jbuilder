json.array!(@notes) do |note|
  json.extract! note, :id, :note, :task_is, :user_id, :shared
  json.url note_url(note, format: :json)
end
