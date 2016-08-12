require 'rails_helper'

RSpec.describe UsersController, type: :controller do

  describe "GET #finish_signup" do
    it "returns http success" do
      get :finish_signup
      expect(response).to have_http_status(:success)
    end
  end

end
