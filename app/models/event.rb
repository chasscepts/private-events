class Event < ApplicationRecord
    belongs_to :invitee, class_name: "User"
    belongs_to :creator, class_name: "User"
end
