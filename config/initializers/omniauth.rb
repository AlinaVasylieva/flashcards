Rails.application.config.middleware.use OmniAuth::Builder do 
  provider :facebook, '332472093786073', '3ac1ea8328e68fb66451605ca8c0a19a' 
end
