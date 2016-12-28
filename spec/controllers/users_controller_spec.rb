require 'rails_helper'

RSpec.describe UsersController, type: :controller do

  describe "GET #new" do
    it "saved in DB when not found" do
      User.destroy_all
      expect { 
      post :create, {user: FactoryGirl.attributes_for(:user)}
      }.to change { User.count }
    end
  end
end
