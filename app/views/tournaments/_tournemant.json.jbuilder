json.extract! tournament, :id, :name, :user_id, :description, :start_date, :created_at, :updated_at
json.url tournament_url(tournament, format: :json)
