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

    ##
    # выведем линейный список категорий с иконками
    #
    # состав view:
    #   иконка
    #   кликабельное название
    #
    # параметрами можно добавить css стиль и указать размер иконки
    #
    # порядок элементов - определяется Offer.all_widgeted.def_order
    # количество позиций - фиксированно: Prop.positions_count
    #
    # css class: offer_list_iconed

    def render_offers_list_iconed(css_style:'default', thumb_size:'thumb_sm')

      # свойства модуля
      p = Prop.first

      # список категорий, которые надо вывести в виджете
      list = Offer.all_widgeted.def_order

      # сколько должно быть позиций?
      positions_count = p.positions_count
      # Rails.logger.debug "[TRACE] positions_count: #{positions_count}; list.count: #{list.count}"

      # если всего в списке меньше, чем надо - добьём список слотами
      if list.count < positions_count
        delta = positions_count - list.count
        delta.times do |i|
          # Rails.logger.debug "[TRACE] Offer.new"
          list << Offer.new({ title: '' })
        end
      end

      # чтобы вёрстка не прыгала - зафиксируем размер картинки
      w = p.send("#{thumb_size}_width") #.thumb_sm_width
      h = p.send("#{thumb_size}_height") #.thumb_sm_height

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