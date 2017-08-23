class CreateOptions < ActiveRecord::Migration[5.0]
  def change
    create_table :options do |t|
    	t.string :choice
    	t.references :survey
    end
  end
end
