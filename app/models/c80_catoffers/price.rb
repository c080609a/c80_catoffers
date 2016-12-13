module C80Catoffers

  class Price < ActiveRecord::Base
    mount_uploader :file, PriceUploader
  end

end