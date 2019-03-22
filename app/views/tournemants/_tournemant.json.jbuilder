json.extract! tournemant, :id, :name, :user_id, :description, :start_date, :created_at, :updated_at
json.url tournemant_url(tournemant, format: :json)
