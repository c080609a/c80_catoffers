class C80Catoffers::Crow < ActiveRecord::Base
  belongs_to :csample
  belongs_to :offer
  scope :def_order, -> {order(:ord => :asc)}

  def offer_price_integer
    res = 0
    if self.offer.present?
      res = self.offer.price_integer
    end
    res
  end

  def offer_title
    res = ''
    if self.offer.present?
      res = self.offer.title
    end
    res
  end

end
