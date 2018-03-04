class PhotoUploader < CarrierWave::Uploader::Base
  include Cloudinary::CarrierWave
    process eager: true  # Force version generation at upload time.

    process convert: 'jpg'

    version :thumbnail do
      resize_to_fill 256, 256
    end

    version :car_thumbnail do
      resize_to_fill 512, 512
    end
end
