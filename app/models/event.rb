class Event < ApplicationRecord
    belongs_to :creator, class_name: "User"
    has_many :event_invitations, foreign_key: :attended_event_id
    has_many :attendees, through: :event_invitations, source: :event_attendee


  scope :past, -> { where( "event_date > DATE('now')" ) }
  scope :upcoming, -> { where( "event_date < DATE('now')"  ) }

  validates :description, presence: true, length: { minimum: 10 }
  validates :event_date, presence: true
end
