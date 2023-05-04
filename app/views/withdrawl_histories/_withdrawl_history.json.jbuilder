json.extract! withdrawl_history, :id, :w_coins, :Trans_type_logo, :Transaction_ID, :transaction_type, :created_at, :updated_at
json.url withdrawl_history_url(withdrawl_history, format: :json)
