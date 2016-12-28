FactoryGirl.define do
  factory :user do
    email "user_one@example.com"
    password "example"
    created_at (Date.today)                   
    updated_at (Date.today)                   
    crypted_password '$2a$10$ZVNDCcDAvaF6B6aoYZhf..gUxLu80KLCbbvdQRqXQNn...'
    salt 'bPJVBAc46hPyTc8dxWZH'
    provider "facebook"
    uid '63354567839263'
    name 'Example User'
    remember_me_token 'nil'
    remember_me_token_expires_at 'nil'
  end
end
