module C80Catoffers
  module Inner
    module CssHelper

      ##
      # Помогает методу +render_offers_widget+ тем, что содержит код,
      # перебирающий имена свойств из +list_of_props+,
      # находит значения в элементе +offer+,
      # и возвращает релевантный список значений

      def _proccess_list_of_props(list_of_props, offer)

        # результат соберём тут
        list_of_values = []

        # переберём имена свойств, подберём для каждого значение
        list_of_props.each_with_index do |prop_name, index|
          prop_value = offer.try(prop_name)
          unless prop_value.present?
            prop_value = 'Значение не определено'
          end
          list_of_values << prop_value
        end

        list_of_values

      end

      ##
      # Помогает методам этого хелпер-модуля: выдаёт слотованный список предложений,
      # которые необходимо вывести в виджете.
      #

      def _get_widgeted_offers_with_slots

        # свойства модуля
        p = Prop.first

        # результат соберём тут список категорий, которые надо вывести в виджете
        list = Offer.all_widgeted.def_order

        # сколько должно быть позиций?
        positions_count = p.positions_count
        # Rails.logger.debug "[TRACE] positions_count: #{positions_count}; list.count: #{list.count}"

        # если всего в списке меньше, чем надо - добьём список слотами
        if list.count < positions_count
          delta = positions_count - list.count
          delta.times do |i|
            # Rails.logger.debug "[TRACE] Offer.new"
            list << Offer.new({
                                  title: "Свободное место №#{i}",
                                  price: 'Цену уточняйте в админке',
                                  short_desc: 'Описание не указано'
                              }
            )
          end
        end

        list

      end

      ##
      # Спец-метод узкого назначения - формирует css стиль, фиксирует габариты ссылки-конейнера,
      # в которую помещена картинка.
      # Также, предполагает, что СЛЕВА/СПРАВА от картинки располагается блок типа title,
      # и для таких блоков фиксируется ВЫСОТА (подгоняется под ВЫСОТУ картинки)

      def _calc_css_for_list_iconed(thumb_size)

        # свойства модуля
        p = Prop.first

        # css_for_a: ,
        # css_for_title:

        # чтобы вёрстка не прыгала - зафиксируем размер картинки
        w = p.send("#{thumb_size}_width") #.thumb_sm_width
        h = p.send("#{thumb_size}_height") #.thumb_sm_height

        res = {
            :a_lazy_wrapper => "width:#{w}px;height:#{h}px",
            :title => "height:#{h}px;line-height:#{h}px"
        }

        # Rails.logger.debug "[TRACE] <_calc_css_for_list_iconed> #{res}"
        res

      end

      ##
      # Спец-метод узкого назначения - формирует css стиль, фиксирует габариты ссылки-конейнера,
      # в которую помещена картинка и ШИРИНУ соседних элементов списка.

      def _calc_css_for_list_widget(thumb_size)

        # свойства модуля
        p = Prop.first

        # css_for_a: ,
        # css_for_title:

        # чтобы вёрстка не прыгала - зафиксируем размер картинки
        w = p.send("#{thumb_size}_width") #.thumb_sm_width
        h = p.send("#{thumb_size}_height") #.thumb_sm_height

        res = {
            :a_lazy_wrapper => "width:#{w}px;height:#{h}px",
            :title => "width:#{h}px"
        }

        # Rails.logger.debug "[TRACE] <_calc_css_for_list_iconed> #{res}"
        res

      end


    end
  end
end