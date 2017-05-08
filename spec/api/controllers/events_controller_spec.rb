require 'rails_helper'

RSpec.describe API::EventsController, type: :controller do
  let!(:user) { create(:user) }
  let!(:registered_application) { create(:registered_application, user_id: user.id ) }

  context "authenticated user" do
    before do
      controller.request.env['HTTP_ORIGIN'] = registered_application.url
      @new_event = build(:event, registered_application_id: registered_application.id)
    end

    describe "POST create" do
      before(:each) do
        sign_in user
        post :create, event: {
          name: @new_event.name,
          registered_application_id: @new_event.registered_application_id
        }
      end

      it "returns http success" do
        expect(response).to have_http_status(:success)
      end

      it "returns json content type" do
        expect(response.content_type).to eq 'application/json'
      end

      it "creates a topic with the correct attributes" do
        hashed_json = JSON.parse(response.body)
        expect(hashed_json["name"]).to eq(@new_event.name)
      end
    end
  end
end
