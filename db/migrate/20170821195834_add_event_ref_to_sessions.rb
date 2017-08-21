class AddEventRefToSessions < ActiveRecord::Migration[5.0]
  def change
    add_reference :sessions, :event, foreign_key: true
  end
end
