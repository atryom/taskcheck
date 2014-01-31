json.array!(@tasks) do |task|
  json.extract! task, :id, :name, :note, :status_id, :group_id, :duration, :deadline
  json.url task_url(task, format: :json)
end
