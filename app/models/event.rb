class Event < ApplicationRecord
    belongs_to :creator, class_name: "User"
    has_many :event_invitations, foreign_key: :attended_event_id
    has_many :attendees, through: :event_invitations, source: :event_attendee
  

  scope :past, -> { where( "event_date > DATE('now')" ) }
  scope :upcoming, -> { where( "event_date < DATE('now')"  ) }
  
  # def self.past
  #   Event.all.select { |event| !event.event_date.nil? && event.event_date < Time.now }
  # end


  # def self.upcoming
  #   Event.all.select { |event| !event.event_date.nil? && event.event_date > Time.now }
  # end

end
