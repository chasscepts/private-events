require 'rails_helper'

RSpec.describe Event, :type => :model do
  context 'correctly validates columns' do
    let (:valid_description) { 'This is a valid description' }
    let (:valid_date) { Time.now }
    let (:user) { User.create(username: 'username' ) }
    it "description with length less than 10 does not pass validation" do
      expect(user.created_events.build(description: 'as', event_date: valid_date).valid?).to be false
    end

    it "validates presence of description with minimum, length" do
      expect(user.created_events.build(description: valid_description, event_date: Date.new).valid?).to be true
    end

    it 'does not pass validation if event_date is not provided' do
      expect(user.created_events.build(description: valid_description).valid?).to be false
    end

    it 'validates presence of event_date' do
      expect(user.created_events.build(description: valid_description, event_date: valid_date).valid?).to be true
    end
  end

  context "associates to events as creator" do
    let (:user) { User.create!(username: 'username') }
    it "correctly associates to the creator" do
      event = user.created_events.create!(description: 'test event', event_date: Time.now)
      expect(event.creator).to eq(user)
    end
  end
end
