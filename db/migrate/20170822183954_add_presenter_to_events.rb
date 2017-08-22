class AddPresenterToEvents < ActiveRecord::Migration[5.0]
  def change
    add_column :events, :presenter_id, :integer
  end
end
