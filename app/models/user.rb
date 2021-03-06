class User < ApplicationRecord
  has_many :created_events, foreign_key: 'creator_id', class_name: 'Event'

  has_many :event_invitations, foreign_key: :event_attendee_id
  has_many :attending_events, through: :event_invitations, source: :attended_event

  validates :username, presence: true, uniqueness: true, length: { minimum: 3 }
end
