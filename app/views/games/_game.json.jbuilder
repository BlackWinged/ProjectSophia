json.extract! game, :id, :gameName, :filepath, :created_at, :updated_at
json.url game_url(game, format: :json)