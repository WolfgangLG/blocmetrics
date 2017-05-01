require 'rails_helper'

RSpec.describe RegisteredApplicationsController, type: :controller do
  let(:user) { create(:user) }

  context "guest user" do
    describe "GET #index" do
      it "redirects unauthenticated users" do
        registered_application = RegisteredApplication.create(name: "Testy App", url: "www.testytester.com", user_id: user.id )
        get :index
        expect(response).to redirect_to(new_user_session_path)
      end
    end

    describe "GET #show" do
      it "redirects unauthenticated users" do
        registered_application = RegisteredApplication.create(name: "Testy App", url: "www.testytester.com", user_id: user.id )
        get :show, id: registered_application.id
        expect(response).to redirect_to(new_user_session_path)
      end
    end

    describe "GET #new" do
      it "redirects unauthenticated users" do
        registered_application = RegisteredApplication.create(name: "Testy App", url: "www.testytester.com", user_id: user.id )
        get :new
        expect(response).to redirect_to(new_user_session_path)
      end
    end

  end

  context "authenticated user" do
    describe "GET #index" do
      before(:each) do
        sign_in user
      end

      it "assigns all registered_applications as @registered_applications" do
        registered_application = RegisteredApplication.create(name: "Testy App", url: "www.testytester.com", user_id: user.id )
        get :index
        expect(assigns(:registered_applications)).to eq([registered_application])
      end
    end

    describe "GET #show" do
      before(:each) do
        sign_in user
      end

      it "returns http success" do
        registered_application = RegisteredApplication.create(name: "Testy App", url: "www.testytester.com", user_id: user.id )
        get :show, id: registered_application.id
        expect(response).to have_http_status(:success)
      end

      it "renders the #show view" do
        registered_application = RegisteredApplication.create(name: "Testy App", url: "www.testytester.com", user_id: user.id )
        get :show, id: registered_application.id
        expect(response).to render_template :show
      end

      it "assigns registered_application to @registered_application" do
        registered_application = RegisteredApplication.create(name: "Testy App", url: "www.testytester.com", user_id: user.id )
        get :show, id: registered_application.id
        expect(assigns(:registered_application)).to eq(registered_application)
      end
    end

    describe "GET #new" do
      before(:each) do
        sign_in user
      end

      it "returns http success" do
        get :new
        expect(response).to have_http_status(:success)
      end

      it "renders the #new view" do
        get :new
        expect(response).to render_template :new
      end

      it "instantiates @registered_application" do
        get :new
        expect(assigns(:registered_application)).not_to be_nil
      end

      it "assigns a new registered_application as @registered_application" do
        get :new
        expect(assigns(:registered_application)).to be_a_new(RegisteredApplication)
      end
    end

    # describe "GET #edit" do
    #   it "assigns the requested registered_application as @registered_application" do
    #     registered_application = RegisteredApplication.create! valid_attributes
    #     get :edit, params: {id: registered_application.to_param}, session: valid_session
    #     expect(assigns(:registered_application)).to eq(registered_application)
    #   end
    # end
    #
    # describe "POST #create" do
    #   context "with valid params" do
    #     it "creates a new RegisteredApplication" do
    #       expect {
    #         post :create, params: {registered_application: valid_attributes}, session: valid_session
    #       }.to change(RegisteredApplication, :count).by(1)
    #     end
    #
    #     it "assigns a newly created registered_application as @registered_application" do
    #       post :create, params: {registered_application: valid_attributes}, session: valid_session
    #       expect(assigns(:registered_application)).to be_a(RegisteredApplication)
    #       expect(assigns(:registered_application)).to be_persisted
    #     end
    #
    #     it "redirects to the created registered_application" do
    #       post :create, params: {registered_application: valid_attributes}, session: valid_session
    #       expect(response).to redirect_to(RegisteredApplication.last)
    #     end
    #   end
    #
    #   context "with invalid params" do
    #     it "assigns a newly created but unsaved registered_application as @registered_application" do
    #       post :create, params: {registered_application: invalid_attributes}, session: valid_session
    #       expect(assigns(:registered_application)).to be_a_new(RegisteredApplication)
    #     end
    #
    #     it "re-renders the 'new' template" do
    #       post :create, params: {registered_application: invalid_attributes}, session: valid_session
    #       expect(response).to render_template("new")
    #     end
    #   end
    # end
    #
    # describe "PUT #update" do
    #   context "with valid params" do
    #     let(:new_attributes) {
    #       skip("Add a hash of attributes valid for your model")
    #     }
    #
    #     it "updates the requested registered_application" do
    #       registered_application = RegisteredApplication.create! valid_attributes
    #       put :update, params: {id: registered_application.to_param, registered_application: new_attributes}, session: valid_session
    #       registered_application.reload
    #       skip("Add assertions for updated state")
    #     end
    #
    #     it "assigns the requested registered_application as @registered_application" do
    #       registered_application = RegisteredApplication.create! valid_attributes
    #       put :update, params: {id: registered_application.to_param, registered_application: valid_attributes}, session: valid_session
    #       expect(assigns(:registered_application)).to eq(registered_application)
    #     end
    #
    #     it "redirects to the registered_application" do
    #       registered_application = RegisteredApplication.create! valid_attributes
    #       put :update, params: {id: registered_application.to_param, registered_application: valid_attributes}, session: valid_session
    #       expect(response).to redirect_to(registered_application)
    #     end
    #   end
    #
    #   context "with invalid params" do
    #     it "assigns the registered_application as @registered_application" do
    #       registered_application = RegisteredApplication.create! valid_attributes
    #       put :update, params: {id: registered_application.to_param, registered_application: invalid_attributes}, session: valid_session
    #       expect(assigns(:registered_application)).to eq(registered_application)
    #     end
    #
    #     it "re-renders the 'edit' template" do
    #       registered_application = RegisteredApplication.create! valid_attributes
    #       put :update, params: {id: registered_application.to_param, registered_application: invalid_attributes}, session: valid_session
    #       expect(response).to render_template("edit")
    #     end
    #   end
    # end
    #
    # describe "DELETE #destroy" do
    #   it "destroys the requested registered_application" do
    #     registered_application = RegisteredApplication.create! valid_attributes
    #     expect {
    #       delete :destroy, params: {id: registered_application.to_param}, session: valid_session
    #     }.to change(RegisteredApplication, :count).by(-1)
    #   end
    #
    #   it "redirects to the registered_applications list" do
    #     registered_application = RegisteredApplication.create! valid_attributes
    #     delete :destroy, params: {id: registered_application.to_param}, session: valid_session
    #     expect(response).to redirect_to(registered_applications_url)
    #   end
    # end
  end
end
