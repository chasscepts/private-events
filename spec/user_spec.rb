require 'rails_helper'

RSpec.describe User, :type => :model do
  context 'correctly validates username' do
    it "validates username" do
      expect(User.new(username: 'as').valid?).to be false
    end

    it "validates a user with invalid user" do
      expect(User.new(username: 'asa').valid?).to be true
    end
  end

  context "associates to events as creator" do
    let (:user) { User.create!(username: 'username') }
    it "correctly creates an event" do
      event = user.created_events.create!(description: 'test event', event_date: Time.now)
      expect(event.creator_id).to eq(user.id)
    end

    it "finds all events that it created" do
      event = Event.create!(creator_id: user.id, description: 'test event 2', event_date: Time.now)
      expect((user.created_events.all.to_a.map { |e| e.id })).to include(event.id)
    end
  end

end
