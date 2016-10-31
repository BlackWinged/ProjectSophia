json.extract! memory_log, :id, :timestamp, :description, :user, :created_at, :updated_at
json.url memory_log_url(memory_log, format: :json)