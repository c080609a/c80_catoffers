module C80Catoffers
  module AppHelper

    def render_offer_full_desc(offer_tag)

      offer = Offer.where(:slug => offer_tag).first

      if offer.present?
        render :partial => 'c80_catoffers/offer_full_desc',
               :locals => {
                   :frames => offer.ophotos,
                   :image_alt => offer.title,
                   :desc => offer.desc,
                   :price => offer.price,
                   :order_button_label => 'Оставить заявку',
                   :predefined_text_in_order_form => "Добрый день! Оставляю заявку на услугу '#{ offer.title }'.",
                   :subj_id => offer.id
               }
      end

    end

    # выдать текстовый список предложений из указанной категории
    def render_offers_list_by_cat(category_tag)

      offers = C80Catoffers::Offer.joins(:categories).where(:c80_catoffers_categories => {:slug => category_tag})

      render :partial => 'c80_catoffers/offers_list_by_cat',
             :locals => {
                 list: offers
             }

    end

    def render_offers_list_grouped

      # результат соберём тут
      res = []

      # сначала выведем предложения без категории
      res << { cat_title: nil, offers: Offer.without_category }

      # затем выведем предложения с категориями
      Category.all.each do |cat|
        res << { cat_title: cat.title, offers: cat.offers }
      end

      render :partial => 'c80_catoffers/offers_list_grouped',
             :locals => {
                 list: res
             }

    end

    # выведем линейный список категорий с иконками
    def render_offers_list_iconed(css_style:'default')

      # список категорий
      list = Offer.all.def_order

      # чтобы вёрстка не прыгала - зафиксируем размер картинки
      p = C80Catoffers::Prop.first
      w = p.thumb_sm_width
      h = p.thumb_sm_height

      render :partial => 'c80_catoffers/offers_list_iconed',
             :locals => {
                 list: list,
                 css_style_for_block: css_style,
                 css_for_a: "width:#{w}px;height:#{h}px",
                 css_for_title: "height:#{h}px;line-height:#{h}px"
             }


    end

  end
end