class CreateVotes < ActiveRecord::Migration[5.0]
  def change
    create_table :votes do |t|
    	t.references :survey
    	t.references :option
    	t.references :user

      t.timestamps
    end
  end
end
