module C80Catoffers
  module Inner
    module ModalHelper

      def _render_bs_modal(content='', title='')
        render :partial => 'c80_catoffers/bs_modal',
               :locals => {
                   title: title,
                   content: content,
                   close_label: 'Закрыть'
               }
      end

    end
  end
end