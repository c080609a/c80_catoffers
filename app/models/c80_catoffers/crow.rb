class C80Catoffers::Crow < ActiveRecord::Base
  belongs_to :csample
  belongs_to :offer
  scope :def_order, -> {order(:ord => :asc)}
end
