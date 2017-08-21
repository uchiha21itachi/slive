class CreateSessions < ActiveRecord::Migration[5.0]
  def change
    create_table :sessions do |t|
      t.time :start_at

      t.timestamps
    end
  end
end
