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
      # Rails.logger.debug "[TRACE] <render_offers_list_iconed>"

      # свойства модуля
      p = Prop.first

      # список категорий, которые надо вывести в виджете (со слотами)
      list = _get_widgeted_offers_with_slots

      # чтобы вёрстка не прыгала - зафиксируем размер картинки
      css_wh = _calc_css_for_list_iconed(thumb_size)

      render :partial => 'c80_catoffers/offers_list_iconed',
             :locals => {
                 list: list,
                 css_style_for_block: css_style,
                 css_for_a: css_wh[:a_lazy_wrapper],
                 css_for_title: css_wh[:title]
             }


    end

    ##
    # Построить линейный слотованный список предложений, каждое предложение
    # в списке и представить в виде блока с указанным ВЕРТИКАЛЬНЫМ списком свойств +list_of_props+
    #
    def render_offers_widget(p_list_of_props, style='default', thumb_size='thumb_md')

      # соберём слотованный список предложений
      list_offers = _get_widgeted_offers_with_slots

      # релевантный список списков значений указанных характеристик слотованного списка предложений
      list_of_values = []

      # обойдём этот список и для каждого предложения соберём релевантный список значений свойств
      list_offers.each do |offer|

        # соберём и обработаем значения нужных характеристик каждого предложения
        vals = _proccess_list_of_props(p_list_of_props, offer)
        list_of_values << vals
      end

      # чтобы вёрстка не прыгала - зафиксируем размер картинки
      css_wh = _calc_css_for_list_widget(thumb_size)

      render :partial => 'c80_catoffers/offers_list_widget',
             :locals => {
                 list_props: p_list_of_props,
                 css_style_for_block: style,
                 list_offers: list_offers,
                 list_of_values_lists: list_of_values,
                 css_for_a: css_wh[:a_lazy_wrapper],
                 css_for_title: css_wh[:title]
             }

    end

  end
end