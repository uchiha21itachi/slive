class AddPhotoToSlide < ActiveRecord::Migration[5.0]
  def change
    add_column :slides, :photo, :string
  end
end
