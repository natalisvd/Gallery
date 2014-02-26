Rails.application.config.middleware.use OmniAuth::Builder do
  provider :developer unless Rails.env.production?
  provider :facebook, '525892980852597', '63760b251cb21052915c52b6855f6de6'
end