class ImageUploader < CarrierWave::Uploader::Base

  storage :file
  
  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  def move_to_cache
   true
 end

 def move_to_store
   true
 end
end
