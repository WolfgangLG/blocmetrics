require 'rails_helper'

RSpec.describe RegisteredApplication, type: :model do
  let(:user) { create(:user) }
  let(:my_registered_application) { create(:registered_application, user_id: user.id) }

  it { is_expected.to belong_to(:user) }

  describe "attributes" do
    it "should have name and url attributes" do
      expect(my_registered_application).to have_attributes(name: my_registered_application.name, url: my_registered_application.url)
    end
  end
end
