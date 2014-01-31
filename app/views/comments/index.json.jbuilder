json.array!(@comments) do |comment|
  json.extract! comment, :id, :comment, :task_is, :user_id
  json.url comment_url(comment, format: :json)
end
