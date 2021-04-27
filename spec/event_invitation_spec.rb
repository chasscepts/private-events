require 'rails_helper'

RSpec.describe EventInvitation, :type => :model do
  context 'correctly associates event to user' do
    let (:host) { User.create!(username: 'host') }
    let (:attendee) { User.create!(username: 'attendee') }
    let (:event) { host.created_events.create!(description: 'A valid event', event_date: Time.now) }

    it "event records attendee as an attendee" do
      ivt = EventInvitation.create!(event_attendee_id: attendee.id, attended_event_id: event.id)
      expect(event.attendees.map { |a| a.id }).to include(attendee.id)
    end

    it 'attendee records event as an attending event' do
      EventInvitation.create!(event_attendee_id: attendee.id, attended_event_id: event.id)
      expect(attendee.attending_events.all.map { |e| e.id }).to include(event.id)
    end
  end
end
