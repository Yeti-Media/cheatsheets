Rails.application.config.middleware.use OmniAuth::Builder do
  provider :twitter , Settings.twitter.consumer_key , Settings.twitter.consumer_secret
  provider :facebook , Settings.facebook.app_id , Settings.facebook.secret_key
end

