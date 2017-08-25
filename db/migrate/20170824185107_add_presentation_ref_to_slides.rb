class AddPresentationRefToSlides < ActiveRecord::Migration[5.0]
  def change
    add_reference :slides, :presentation, foreign_key: true
  end
end
