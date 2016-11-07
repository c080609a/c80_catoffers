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
    has_and_belongs_to_many :props

    has_many :crows, :dependent => :destroy

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

    # добавил возможность получить предложения, которым не назначена категория
    def self.without_category
      habtm_table = Arel::Table.new(:c80_catoffers_categories_offers)
      join_table_with_condition = habtm_table.project(habtm_table[:offer_id])
      where(Offer.arel_table[:id].not_in(join_table_with_condition))
    end

    # выдать список тех предложений, которые должны выводиться в виджете
    def self.all_widgeted
      self.joins(:props)
    end

    # NOTE:: пока используется в list_iconed, устарел, т.к. появился ophoto_thumb
    def ophoto_thumb_sm
      res = ''
      if ophotos.count > 0
        res = ophotos.first.image.thumb_sm
      end
      res
    end

    # выдать обложку предложения указанного размера
    # используется, например, при формировании списка предложений с картинками в виджете
    def ophoto_thumb(thumb_size='thumb_sm')
      res = ''
      if ophotos.count > 0
        res = ophotos.first.image_thumb(thumb_size)
      end
      res
    end

    def price_integer
      d = self.price.match '\d+'
      d.present? ? d[0].to_i : 0
    end

  end

end