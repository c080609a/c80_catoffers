module C80Catoffers
  # грузит картинку акции
  class OphotoUploader < BaseFileUploader

    process :resize_to_limit => [1024,768]

    version :thumb_fill do
      process :resize_to_fill => [150,150]
    end

    version :thumb_fit do
      process :resize_to_fit => [150,150]
    end

    def store_dir
      "uploads/oimages"
    end

  end

end