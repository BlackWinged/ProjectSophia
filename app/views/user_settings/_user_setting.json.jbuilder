json.extract! user_setting, :id, :baseInterval, :increaseMultiplier, :integer, :created_at, :updated_at
json.url user_setting_url(user_setting, format: :json)