module C80Catoffers
  class Ophoto < ActiveRecord::Base

    belongs_to :offer
    mount_uploader :image, OphotoUploader

    # выдать картинку указанного размера
    def image_thumb(thumb_size)
      res = ''
      if image.present?
        res = image.send("#{thumb_size}")
      end
    end


  end

end
