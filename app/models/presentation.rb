require 'fileutils'

class Presentation < ApplicationRecord
  mount_uploader :pdf_file, PhotoUploader
  belongs_to :event
  has_many :slides, dependent: :destroy

  def generate_slides
    SlideuploaderJob.perform_later(self.id)
  end

end
