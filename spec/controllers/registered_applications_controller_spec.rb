require 'rails_helper'

RSpec.describe RegisteredApplicationsController, type: :controller do
  include Devise::Test::IntegrationHelpers

  let!(:user) { create(:user) }
  let(:valid_attributes) { {
     name: "Testy Tester",
     url: "www.testytester.com",
     user_id: 1
     } }
  let(:my_registered_application) { create(:registered_application, user_id: user.id) }

  context "Signed in, authenticated, confirmed user" do
    # before do
    #   sign_in user
    #   # sign_in(:user, User.find(params[:id]))
    # end

    describe "GET #show" do
      it "returns http success" do
        get :show, user_id: user.id, id: my_registered_application.id
        expect(response).to have_http_status(:success)
      end

      it "renders the #show view" do
        get :show, user_id: user.id, id: my_registered_application.id
        expect(response).to render_template :show
      end

      it "assigns my_registered_application to @registered_application" do
        get :show, user_id: user.id, id: my_registered_application.id
        expect(assigns(:registered_application)).to eq(my_registered_application)
      end
    end

    describe "GET #new" do
      it "returns http success" do
        get :new, user_id: user.id
        expect(response).to have_http_status(:success)
      end

      it "renders the #new view" do
        get :new, user_id: user.id
        expect(response).to render_template :new
      end

      it "instantiates @registered_application" do
        get :new, user_id: user.id
        expect(assigns(:registered_application)).not_to be_nil
      end
    end

    describe "GET #edit" do
      it "returns http success" do
        get :edit, user_id: user.id, id: my_registered_application.id
        expect(response).to have_http_status(:success)
      end

      it "renders the #edit view" do
        get :edit, user_id: user.id, id: my_registered_application.id
        expect(response).to render_template :edit
      end

      it "assigns registered_application to be updated to @registered_application" do
        get :edit, user_id: user.id, id: my_registered_application.id
        app_instance = assigns(:registered_application)

        expect(app_instance.id).to eq my_registered_application.id
        expect(app_instance.name).to eq my_registered_application.name
        expect(app_instance.url).to eq my_registered_application.url
      end

      it "assigns the requested registered_application as @registered_application" do
        get :edit, id: my_registered_application.id
        expect(assigns(:registered_application)).to eq(my_registered_application)
      end
    end

    describe "POST #create" do
      it "creates a new RegisteredApplication" do
        expect {
          post :create, user_id: user.id, registered_application: { name: "Hello World", url: "www.helloworld.com"}
        }.to change(RegisteredApplication, :count).by(1)
      end

      it "assigns a newly created registered_application as @registered_application" do
        post :create, user_id: user.id, registered_application: { name: "Hello World", url: "www.helloworld.com"}
        expect(assigns(:registered_application)).to be_a(RegisteredApplication)
        expect(assigns(:registered_application)).to be_persisted
      end

      it "redirects to the created registered_application" do
        post :create, user_id: user.id, registered_application: { name: "Hello World", url: "www.helloworld.com"}
        expect(response).to redirect_to(RegisteredApplication.last)
      end
    end

    describe "PUT #update" do
      it "updates post with expected attributes" do
        new_name = "New Name"
        new_url = "www.newurl.com"

        put :update, user_id: user.id, id: my_registered_application.id, registered_application: {name: new_name, url: new_url}

        updated_app = assigns(:registered_application)
        expect(updated_app.id).to eq my_registered_application.id
        expect(updated_app.name).to eq new_name
        expect(updated_app.url).to eq new_url
      end

      it "redirects to the updated app" do
        new_name = "New Name"
        new_url = "www.newurl.com"

        put :update, user_id: user.id, id: my_registered_application.id, registered_application: {name: new_name, url: new_url}
        expect(response).to redirect_to [my_registered_application]
      end
    end

    describe "DELETE #destroy" do
      it "deletes the app" do
        delete :destroy, user_id: user.id, id: my_registered_application.id
        count = RegisteredApplication.where({id: my_registered_application.id}).size
        expect(count).to eq 0
      end

      it "redirects to reg apps index" do
        delete :destroy, user_id: user.id, id: my_registered_application.id
        expect(response).to redirect_to registered_applications_path
      end
    end
  end
end
