json.extract! message, :id, :title, :description, :project_id, :created_at, :updated_at
json.url message_url(message, format: :json)
