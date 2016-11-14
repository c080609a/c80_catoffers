module C80Catoffers
  module UrlsHelper

    def root_url_fake
      '/'
    end

    def my_url_for_offer(offer)

      s = ''
      if offer.has_category?
        s = "#{root_url_fake}#{offer.category.slug}/#{offer.slug}"
      else
        s = "#{root_url_fake}offers/#{offer.slug}" # TODO_MY:: хардкод в урле [аналогично в routes.rb]
      end

      s

    end

    def my_url_for_category(category)
      "#{root_url_fake}categories/#{category.slug}"
    end

  end
end