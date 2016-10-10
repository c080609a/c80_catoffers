module C80Catoffers
  class Prop < ActiveRecord::Base
    has_and_belongs_to_many :offers
  end
end