class CreatePresentations < ActiveRecord::Migration[5.0]
  def change
    create_table :presentations do |t|
      t.string :name
      t.references :event, foreign_key: true

      t.timestamps
    end
  end
end
