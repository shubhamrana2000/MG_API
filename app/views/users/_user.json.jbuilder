json.extract! user, :id, :deviceId, :deviceType, :deviceName, :socialType, :socialId, :socialToken, :socialEmail, :socialName, :socialImgUrl, :adverstisiingId, :versionName, :versionCode, :utmSource, :utmMedium, :utmterm, :utmContent, :utmCampaign, :created_at, :updated_at
json.url user_url(user, format: :json)
