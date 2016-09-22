require "babosa"

module C80Catoffers
  class Category < ActiveRecord::Base

    has_many :child_categories, :class_name => 'Category', :foreign_key => 'parent_category_id'
    belongs_to :parent_category, :class_name => 'Category'
    has_and_belongs_to_many :offers

    extend FriendlyId
    friendly_id :title, use: :slugged
    def normalize_friendly_id(input)
      input.to_s.to_slug.normalize(transliterations: :russian).to_s
    end

    def slug_candidates
      [:title] + Array.new(6) {|index| [:title, index+2]}
    end
    
  end
end