class CreateEventInvitations < ActiveRecord::Migration[6.1]
  def change
    create_table :event_invitations do |t|
      t.references :event_attendee
      t.references :attended_event

      t.timestamps
    end
  end
end
