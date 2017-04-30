require 'rails_helper'

RSpec.describe WelcomeController, type: :controller do
  let(:user) { create(:user) }

  describe "GET #index" do
    before(:each) do
      sign_in user
    end

    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end
  end

end
