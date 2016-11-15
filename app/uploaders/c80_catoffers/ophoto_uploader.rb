module C80Catoffers

  # грузит картинку услуги
  class OphotoUploader < BaseFileUploader

    process :resize_to_limit => [1024,768]

    version :thumb_big_one do
      begin
        p = C80Catoffers::Prop.first
        process :resize_to_fill => [p.big_one_width, p.big_one_height]
      rescue => e
      end
    end

    version :thumb_preview do
      begin
        p = C80Catoffers::Prop.first
        process :resize_to_fill => [p.preview_width, p.preview_height]
      rescue => e
      end
    end

    version :thumb_sm do
      begin
        p = C80Catoffers::Prop.first
        process :resize_to_fill => [p.thumb_sm_width, p.thumb_sm_height]
      rescue => e
      end
    end

    version :thumb_md do
      begin
        p = C80Catoffers::Prop.first
        process :resize_to_fill => [p.thumb_md_width, p.thumb_md_height]
      rescue => e
      end
    end

    version :thumb_lg do
      begin
        p = C80Catoffers::Prop.first
        process :resize_to_fill => [p.thumb_lg_width, p.thumb_lg_height]
      rescue => e
      end
    end

    def store_dir
      'uploads/oimages'
    end

  end

end