class RemoveTitleFromQuestion < ActiveRecord::Migration[5.0]
  def change
    remove_column :questions, :title, :string
  end
end
