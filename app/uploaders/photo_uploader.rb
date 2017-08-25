class PhotoUploader < CarrierWave::Uploader::Base
  include Cloudinary::CarrierWave
  after :store, :generate_slides

  def generate_slides(file)
    model.generate_slides if model.class == Presentation
  end
end
