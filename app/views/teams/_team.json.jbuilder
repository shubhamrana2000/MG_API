json.extract! team, :id, :team_name, :team_short_name, :team_logo, :created_at, :updated_at
json.url team_url(team, format: :json)
