json.extract! payment, :id, :title, :description, :value, :date, :created_at, :updated_at
json.url payment_url(payment, format: :json)
