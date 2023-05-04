json.extract! account, :id, :user_id, :securityToken, :versionName, :versionCode, :coins, :referral_code, :created_at, :updated_at
json.url account_url(account, format: :json)
