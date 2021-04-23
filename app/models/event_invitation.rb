class EventInvitation < ApplicationRecord
  belongs_to :attendee_attendee, class_name: "User"
  belongs_to :attended_event, class_name: "Event"
end
