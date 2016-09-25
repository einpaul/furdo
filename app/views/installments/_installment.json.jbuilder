json.extract! installment, :id, :amount, :installment_type, :description, :status, :installment_date, :project_id, :created_at, :updated_at
json.url installment_url(installment, format: :json)