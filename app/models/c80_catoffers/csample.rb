module C80Catoffers
  class Csample < ActiveRecord::Base
    has_many :crows, :dependent => :destroy
    accepts_nested_attributes_for :crows,
                                  :reject_if => lambda { |attributes|
                                    !attributes.present?
                                  },
                                  :allow_destroy => true
    has_and_belongs_to_many :csprops
    mount_uploader :csphoto, CsphotoUploader

    after_update :recalc_summ_price

    def recalc_summ_price

      sum = crows.all
                .map { |crow| crow.offer.price_integer.to_i }
                .inject(0) { |s, x| s + x }

      Rails.logger.debug "[TRACE] <C80Catoffers.recalc_summ_price> sum = #{sum}"

      self.update_column(:summ_price, sum)

    end

  end
end
