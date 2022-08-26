json.extract! booking, :id, :price, :start_date, :end_date, :status, :created_at, :updated_at
json.url booking_url(booking, format: :json)
