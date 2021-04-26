class AddDateToEvent < ActiveRecord::Migration[6.1]
  def change
    add_column :events, :event_date, :datetime
  end
end
