class AddPdfFileToPresentation < ActiveRecord::Migration[5.0]
  def change
    add_column :presentations, :pdf_file, :string
  end
end
