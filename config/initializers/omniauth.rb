Rails.application.config.middleware.use OmniAuth::Builder do
  provider :discord, Rails.application.credentials.discord[:development_client_id], Rails.application.credentials.discord[:development_client_secret]
end