class RegisteredApplicationsController < ApplicationController
  before_action :set_registered_application, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, :except => [:show, :index]

  def index
    @registered_applications = RegisteredApplication.all
  end

  def show
  end

  # GET /registered_applications/new
  # def new
  #   @registered_application = RegisteredApplication.new
  # end
  #
  # # GET /registered_applications/1/edit
  # def edit
  # end
  #
  # # POST /registered_applications
  # def create
  #   @registered_application = RegisteredApplication.new(registered_application_params)
  #
  #   if @registered_application.save
  #     redirect_to @registered_application, notice: 'Registered application was successfully created.'
  #   else
  #     render :new
  #   end
  # end
  #
  # # PATCH/PUT /registered_applications/1
  # def update
  #   if @registered_application.update(registered_application_params)
  #     redirect_to @registered_application, notice: 'Registered application was successfully updated.'
  #   else
  #     render :edit
  #   end
  # end
  #
  # # DELETE /registered_applications/1
  # def destroy
  #   @registered_application.destroy
  #   redirect_to registered_applications_url, notice: 'Registered application was successfully destroyed.'
  # end

  private
    def set_registered_application
      @registered_application = RegisteredApplication.find(params[:id])
    end

    def registered_application_params
      params[:registered_application]
    end
end
