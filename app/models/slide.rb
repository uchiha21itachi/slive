class Slide < ApplicationRecord
  mount_uploader :photo, PhotoUploader
  belongs_to :presentation
end
