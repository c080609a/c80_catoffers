require "babosa"

module C80Catoffers
  class Offer < ActiveRecord::Base

    has_many :ophotos, :dependent => :destroy
    accepts_nested_attributes_for :ophotos,
                                  :reject_if => lambda { |attributes|
                                    !attributes.present?
                                  },
                                  :allow_destroy => true

    scope :def_order, -> {order(:created_at => :desc)}

    has_and_belongs_to_many :categories

    extend FriendlyId
    friendly_id :title, use: :slugged
    def normalize_friendly_id(input)
      input.to_s.to_slug.normalize(transliterations: :russian).to_s
    end

    def slug_candidates
      [:title] + Array.new(6) {|index| [:title, index+2]}
    end

    def has_category?
      self.categories.count > 0
    end

    def category
      res = nil
      if self.has_category?
        res = self.categories.first
      end
      res
    end

  end

end