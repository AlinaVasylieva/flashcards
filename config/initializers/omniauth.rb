Rails.application.config.middleware.use OmniAuth::Builder do 
  provider :facebook, ENV['facebook_key'], ENV['facebook_secret']
  #to request permissions
  #scope: 'email,public_profile,user_friends', display: 'popup'
end
