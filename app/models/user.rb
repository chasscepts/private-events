class User < ApplicationRecord
    has_many :created_events, foreign_key: "creator_id", class_name: "Event"
    has_many :invitee_events, foreign_key: "invitee_id", class_name: "Event"

end
