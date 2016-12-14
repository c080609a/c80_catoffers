module C80Catoffers
  module Inner
    module ModalHelper

      def _render_bs_modal(content='', title='')

        # Если имеется загруженный прайс (в виде файла) - допишем к title ссылку на скачивание
        if Price.all.count > 0
          p = Price.first
          file_url = p.file.url
          file_ext = File.extname(file_url).split('.').join('')
          title = "#{title} (<a href='#{file_url}' title='Откроется в новом окне' target='_blank'>скачать #{file_ext}</a>)"
        end

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