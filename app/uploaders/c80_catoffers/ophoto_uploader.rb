module C80Catoffers

  # грузит картинку услуги
  class OphotoUploader < BaseFileUploader

    process :resize_to_limit => [1024,768]

    version :thumb_big_one do
      Proc.new {
        p = C80Catoffers::Prop.first
        process :resize_to_fill => [p.big_one_width, p.big_one_height]
      }
    end

    version :thumb_preview do
      Proc.new {
        p = C80Catoffers::Prop.first
        process :resize_to_fill => [p.preview_width, p.preview_height]
      }
    end

    version :thumb_sm do
      Proc.new {
        p = C80Catoffers::Prop.first
        process :resize_to_fill => [p.thumb_sm_width, p.thumb_sm_height]
      }
    end

    def store_dir
      'uploads/oimages'
    end

  end

end