module C80Catoffers
  class Csprop < ActiveRecord::Base
    has_and_belongs_to_many :csamples
  end
end