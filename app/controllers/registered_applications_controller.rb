class RegisteredApplicationsController < ApplicationController
  before_action :set_registered_application, only: [:show, :edit, :update, :destroy]
  # before_action :authenticate_user!, :except => [:show]

  def index

    @registered_applications = current_user.registered_applications.all
  end

  def show
  end

  def new
    @registered_application = RegisteredApplication.new
  end

  def edit
  end

  def create
    @registered_application = RegisteredApplication.new(registered_application_params)
    @registered_application.user = current_user

    if @registered_application.save
      redirect_to @registered_application, notice: 'Registered application was successfully created.'
    else
      render :new
    end
  end

  def update
    if @registered_application.update(registered_application_params)
      redirect_to @registered_application, notice: 'Registered application was successfully updated.'
    else
      render :edit, notice: 'There was an error trying to update the application. Please try again.'
    end
  end

  def destroy
    @registered_application.destroy
    redirect_to registered_applications_url, notice: 'Registered application was successfully destroyed.'
  end

  private
    def set_registered_application
      @registered_application = RegisteredApplication.find(params[:id])
    end

    def registered_application_params
      params.require(:registered_application).permit(:name, :url, :user_id)
      # params[:registered_application]
    end
end
