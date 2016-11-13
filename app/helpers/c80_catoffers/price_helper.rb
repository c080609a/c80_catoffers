module C80Catoffers
  module PriceHelper

    def render_price

    end

    def render_popup_price
      render :partial => 'c80_catoffers/popup_price',
             :locals => {
                 title: 'Прайс',
                 content: render_offers_list_grouped
             }
    end

  end
end