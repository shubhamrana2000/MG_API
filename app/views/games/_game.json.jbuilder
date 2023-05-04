json.extract! game, :id, :gamename, :gameurl, :gameimgurl, :gameamt, :created_at, :updated_at
json.url game_url(game, format: :json)
