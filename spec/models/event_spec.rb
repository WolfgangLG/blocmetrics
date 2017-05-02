require 'rails_helper'

RSpec.describe Event, type: :model do
  let(:user) { create(:user) }
  let(:my_registered_application) { create(:registered_application, user_id: user.id) }
  let(:my_event) { create(:event, registered_application_id: my_registered_application.id) }

  it { is_expected.to belong_to(:registered_application) }

  describe "attributes" do
    it "has a name attribute and references a registered application" do
      expect(my_event).to have_attributes(name: my_event.name, registered_application_id: my_registered_application.id)
    end
  end
end
