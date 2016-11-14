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

    scope :def_order, -> {order(:ord => :asc)}

    after_update :recalc_summ_price
    after_create :recalc_summ_price

    def recalc_summ_price

      sum = crows.all
                .map { |crow| crow.offer_price_integer.to_i }
                .inject(0) { |s, x| s + x }

      Rails.logger.debug "[TRACE] <C80Catoffers.recalc_summ_price> sum = #{sum}"

      self.update_column(:summ_price, sum)

    end

    # выдать список тех Примеров, которые должны выводиться в виджете
    def self.all_widgeted
      self.joins(:csprops)
    end
    
    def csphoto_img
      self.csphoto.present? ? MiniMagick::Image.open(self.csphoto.path):nil
      # [img["width"],img["height"]]
    end

  end
end
