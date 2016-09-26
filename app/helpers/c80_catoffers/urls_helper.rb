module C80Catoffers
  module UrlsHelper

    def my_url_for_offer(offer)

      s = ''
      if offer.has_category?
        s = "#{root_url}#{offer.category.slug}/#{offer.slug}"
      else
        s = "#{root_url}offers/#{offer.slug}" # TODO_MY:: хардкод в урле [аналогично в routes.rb]
      end

      s

    end

    def my_url_for_category(category)
      "#{root_url}categories/#{category.slug}"
    end

  end
end