require 'rails_helper'

RSpec.describe RegisteredApplicationsController, type: :controller do

  let(:user) { create(:user) }
  let(:valid_attributes) { {
     name: "Testy Tester",
     url: "www.testytester.com",
     user_id: user.id
     } }
  let(:my_registered_application) { create(:registered_application, user: user) }

  describe "GET #index" do
    it "assigns all registered_applications as @registered_applications" do
      get :index, user_id: user.id
      expect(assigns(:registered_applications)).to eq([my_registered_application])
    end
  end

  describe "GET #show" do
    it "assigns the requested registered_application as @registered_application" do
      get :show, id: my_registered_application.id
      expect(assigns(:registered_application)).to eq(my_registered_application)
    end
  end

  # describe "GET #new" do
  #   it "assigns a new registered_application as @registered_application" do
  #     get :new, params: {}
  #     expect(assigns(:registered_application)).to be_a_new(RegisteredApplication)
  #   end
  # end
  #
  # describe "GET #edit" do
  #   it "assigns the requested registered_application as @registered_application" do
  #     registered_application = RegisteredApplication.create! valid_attributes
  #     get :edit, params: {id: registered_application.to_param}
  #     expect(assigns(:registered_application)).to eq(registered_application)
  #   end
  # end
  #
  # describe "POST #create" do
  #   context "with valid params" do
  #     it "creates a new RegisteredApplication" do
  #       expect {
  #         post :create, params: {registered_application: valid_attributes}
  #       }.to change(RegisteredApplication, :count).by(1)
  #     end
  #
  #     it "assigns a newly created registered_application as @registered_application" do
  #       post :create, params: {registered_application: valid_attributes}
  #       expect(assigns(:registered_application)).to be_a(RegisteredApplication)
  #       expect(assigns(:registered_application)).to be_persisted
  #     end
  #
  #     it "redirects to the created registered_application" do
  #       post :create, params: {registered_application: valid_attributes}
  #       expect(response).to redirect_to(RegisteredApplication.last)
  #     end
  #   end
  #
  #   context "with invalid params" do
  #     it "assigns a newly created but unsaved registered_application as @registered_application" do
  #       post :create, params: {registered_application: invalid_attributes}
  #       expect(assigns(:registered_application)).to be_a_new(RegisteredApplication)
  #     end
  #
  #     it "re-renders the 'new' template" do
  #       post :create, params: {registered_application: invalid_attributes}
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
