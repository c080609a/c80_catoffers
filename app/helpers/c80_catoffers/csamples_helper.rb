module C80Catoffers
  module CsamplesHelper

    def render_samples_widget

      # сформируем первый список - список Примеров
      samples_list = Csample.all_widgeted.def_order

      #-> чтобы вёрстка не прыгала - зафиксируем размер КАЖДОЙ картинки (картинки могут быть разной ШИРИНЫ)

      # обойдём список Примеров и составим СООТВЕТСТВУЮЩИЙ список aux-css-стилей
      aux_css_list = []
      samples_list.each do |csample|
        aux_css_list << _calc_aux_css(csample)
      end

      render :partial => 'c80_catoffers/csamples_widget',
             :locals => {
                 list:                samples_list,
                 aux_css_list:        aux_css_list
             }

    end

    private

    # Спец-метод узкого назначения - формирует вспомогательный css стиль для ВЕРТИКАЛЬНОГО списка элементов,
    # фиксирует габариты ссылки-конейнера,
    # в которую помещена картинка
    def _calc_aux_css(csample)

      w = 0
      h = 0
      img = csample.csphoto_img

      if img.present?
        w = img['width']
        h = img['height']
      end

      res = {
          :a_lazy_wrapper => "width:#{w}px;height:#{h}px"
      }

      # Rails.logger.debug "[TRACE] <_calc_css_for_list_iconed> #{res}"
      res

    end

  end
end