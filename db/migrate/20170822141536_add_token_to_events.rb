class AddTokenToEvents < ActiveRecord::Migration[5.0]
  def change
    add_column :events, :token, :string
  end
end
