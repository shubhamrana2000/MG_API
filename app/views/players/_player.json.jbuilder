json.extract! player, :id, :player_name, :team_id, :created_at, :updated_at
json.url player_url(player, format: :json)
