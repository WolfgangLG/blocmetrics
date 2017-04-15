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
    #
    # describe "PUT #update" do
    #   context "with valid params" do
    #     let(:new_attributes) {
    #       skip("Add a hash of attributes valid for your model")
    #     }
    #
    #     it "updates the requested registered_application" do
    #       registered_application = RegisteredApplication.create! valid_attributes
    #       put :update, params: {id: registered_application.to_param, registered_application: new_attributes}
    #       registered_application.reload
    #       skip("Add assertions for updated state")
    #     end
    #
    #     it "assigns the requested registered_application as @registered_application" do
    #       registered_application = RegisteredApplication.create! valid_attributes
    #       put :update, params: {id: registered_application.to_param, registered_application: valid_attributes}
    #       expect(assigns(:registered_application)).to eq(registered_application)
    #     end
    #
    #     it "redirects to the registered_application" do
    #       registered_application = RegisteredApplication.create! valid_attributes
    #       put :update, params: {id: registered_application.to_param, registered_application: valid_attributes}
    #       expect(response).to redirect_to(registered_application)
    #     end
    #   end
    #
    #   context "with invalid params" do
    #     it "assigns the registered_application as @registered_application" do
    #       registered_application = RegisteredApplication.create! valid_attributes
    #       put :update, params: {id: registered_application.to_param, registered_application: invalid_attributes}
    #       expect(assigns(:registered_application)).to eq(registered_application)
    #     end
    #
    #     it "re-renders the 'edit' template" do
    #       registered_application = RegisteredApplication.create! valid_attributes
    #       put :update, params: {id: registered_application.to_param, registered_application: invalid_attributes}
    #       expect(response).to render_template("edit")
    #     end
    #   end
    # end
    #
    # describe "DELETE #destroy" do
    #   it "destroys the requested registered_application" do
    #     registered_application = RegisteredApplication.create! valid_attributes
    #     expect {
    #       delete :destroy, params: {id: registered_application.to_param}
    #     }.to change(RegisteredApplication, :count).by(-1)
    #   end
    #
    #   it "redirects to the registered_applications list" do
    #     registered_application = RegisteredApplication.create! valid_attributes
    #     delete :destroy, params: {id: registered_application.to_param}
    #     expect(response).to redirect_to(registered_applications_url)
    #   end
    # end
  end
end
