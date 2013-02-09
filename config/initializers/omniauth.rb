Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, '126895764151074', '16dda9965f0f51915b1ff8b46d14d5d4', scope: 'email, publish_stream'#, authorize_params: { display: 'popup' }
end
