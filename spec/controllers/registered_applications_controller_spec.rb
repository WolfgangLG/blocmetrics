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

    describe "POST #create" do
      it "redirects unauthenticated users" do
        post :create, registered_application: { name: "Testy App", url: "www.testytester.com", user_id: user.id }
        expect(response).to redirect_to(new_user_session_path)
      end
    end

    describe "GET #edit" do
      it "redirects unauthenticated users" do
        registered_application = RegisteredApplication.create(name: "Testy App", url: "www.testytester.com", user_id: user.id )
        get :edit, id: registered_application.id
        expect(response).to redirect_to(new_user_session_path)
      end
    end

    describe "PUT #update" do
      it "redirects unauthenticated users" do
        registered_application = RegisteredApplication.create(name: "Testy App", url: "www.testytester.com", user_id: user.id )
        put :update, id: registered_application.id, registered_application: { name: "Testy App Redux", url: "www.testyappredux.com" }
        expect(response).to redirect_to(new_user_session_path)
      end
    end

    describe "DELETE #destroy" do
      it "redirects unauthenticated users" do
        registered_application = RegisteredApplication.create(name: "Testy App", url: "www.testytester.com", user_id: user.id )
        delete :destroy, id: registered_application.id
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

      it "assigns a registered application's events to @events" do
        registered_application = RegisteredApplication.create(name: "Testy App", url: "www.testytester.com", user_id: user.id )
        event = Event.create(name: "Testy Event", registered_application_id: registered_application.id)
        get :show, id: registered_application.id
        expect(registered_application.events.first).to eq(event)
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

    describe "GET #edit" do
      before(:each) do
        sign_in user
      end

      it "assigns the requested registered_application as @registered_application" do
        registered_application = RegisteredApplication.create(name: "Testy App", url: "www.testytester.com", user_id: user.id )
        get :edit, id: registered_application.id
        expect(assigns(:registered_application)).to eq(registered_application)
      end

      it "returns http success" do
        registered_application = RegisteredApplication.create(name: "Testy App", url: "www.testytester.com", user_id: user.id )
        get :edit, id: registered_application.id
        expect(response).to have_http_status(:success)
      end

      it "renders the #edit view" do
        registered_application = RegisteredApplication.create(name: "Testy App", url: "www.testytester.com", user_id: user.id )
        get :edit, id: registered_application.id
        expect(response).to render_template :edit
      end

      it "assigns registered_application to be updated to @registered_application" do
        registered_application = RegisteredApplication.create(name: "Testy App", url: "www.testytester.com", user_id: user.id )
        get :edit, id: registered_application.id
        app_instance = assigns(:registered_application)

        expect(app_instance.id).to eq registered_application.id
        expect(app_instance.name).to eq registered_application.name
        expect(app_instance.url).to eq registered_application.url
      end
    end

    describe "POST #create" do
      before(:each) do
        sign_in user
      end

      it "creates a new RegisteredApplication" do
        expect {
          post :create, registered_application: { name: "Testy App", url: "www.testytester.com", user_id: user.id }
        }.to change(RegisteredApplication, :count).by(1)
      end

      it "assigns a newly created registered_application as @registered_application" do
        post :create, registered_application: { name: "Testy App", url: "www.testytester.com", user_id: user.id }
        expect(assigns(:registered_application)).to be_a(RegisteredApplication)
        expect(assigns(:registered_application)).to be_persisted
      end

      it "redirects to the created registered_application" do
        post :create, registered_application: { name: "Testy App", url: "www.testytester.com", user_id: user.id }
        expect(response).to redirect_to(RegisteredApplication.last)
      end
    end

    describe "PUT #update" do
      before(:each) do
        sign_in user
      end

      it "updates the requested registered_application" do
        registered_application = RegisteredApplication.create(name: "Testy App", url: "www.testytester.com", user_id: user.id )
        put :update, id: registered_application.id, registered_application: { name: "Testy App Redux", url: "www.testyappredux.com" }
        registered_application.reload

        updated_app = assigns(:registered_application)
        expect(updated_app.id).to eq registered_application.id
        expect(updated_app.name).to eq registered_application.name
        expect(updated_app.url).to eq registered_application.url
      end

      it "assigns the requested registered_application as @registered_application" do
        registered_application = RegisteredApplication.create(name: "Testy App", url: "www.testytester.com", user_id: user.id )
        put :update, id: registered_application.id, registered_application: { name: "Testy App Redux", url: "www.testyappredux.com" }
        expect(assigns(:registered_application)).to eq(registered_application)
      end

      it "redirects to the registered_application" do
        registered_application = RegisteredApplication.create(name: "Testy App", url: "www.testytester.com", user_id: user.id )
        put :update, id: registered_application.id, registered_application: { name: "Testy App Redux", url: "www.testyappredux.com" }
        expect(response).to redirect_to(registered_application)
      end
    end

    describe "DELETE #destroy" do
      before(:each) do
        sign_in user
      end

      it "destroys the requested registered_application" do
        registered_application = RegisteredApplication.create(name: "Testy App", url: "www.testytester.com", user_id: user.id )
        delete :destroy, id: registered_application.id
        count = RegisteredApplication.where({id: registered_application.id}).size
        expect(count).to eq 0
      end

      it "redirects to the registered_applications list" do
        registered_application = RegisteredApplication.create(name: "Testy App", url: "www.testytester.com", user_id: user.id )
        delete :destroy, id: registered_application.id
        expect(response).to redirect_to(registered_applications_url)
      end
    end
  end
end
