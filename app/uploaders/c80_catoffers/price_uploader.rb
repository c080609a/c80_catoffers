module C80Catoffers

  class PriceUploader < CarrierWave::Uploader::Base

    storage :file

    def filename
      if original_filename
        "price_#{secure_token(4)}.#{file.extension}"
      end
    end

    protected
    def secure_token(length=16)
      var = :"@#{mounted_as}_secure_token"
      model.instance_variable_get(var) or model.instance_variable_set(var, SecureRandom.hex(length/2))
    end


    def store_dir
      'uploads/prices'
    end

  end

end