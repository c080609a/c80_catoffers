ActiveAdmin.register C80Catoffers::Csample, as: 'Csample' do

  config.per_page = 100

  menu :label => 'Рассчёт стоимости', # TODO_MY:: название пункта меню перенесести в параметры в базу
       priority: 2,
       parent: 'Услуги' # TODO_MY:: название пункта меню перенесести в параметры в базу

  permit_params :title,
                :sub_title,
                :csphoto,
                :ord,
                :crows_attributes => [:id, :_destroy, :offer_id, :ord]

  batch_action :destroy, false

  config.sort_order = 'ord_asc'

  # before_filter :skip_sidebar!, :only => :index

  index do
    selectable_column
    column :ord
    column :title
    column :sub_title
    column :csphoto do |csample|
      if csample.csphoto.present?
        link_to image_tag(csample.csphoto.thumb_md, style: 'width:150px;'), csample.csphoto.url, target: '_blank'
      end
    end
    column :crows do |csample|
      s = csample.crows.def_order
          .map{ |crow| "<li>#{crow.offer.title} (#{crow.offer.price})</li>"}
          .join('')
      s += "<li>Итого: #{ csample.summ_price }</li>"
      "<ul>#{s}</ul>".html_safe
    end
    actions
  end

  form(:html => {:multipart => true}) do |f|

    f.inputs 'Свойства' do

      f.input :title
      f.input :sub_title
      f.input :ord

      f.input :csphoto,
              :as => :file,
              :hint => image_tag(f.object.csphoto.thumb_md)

      f.inputs 'Услуги' do
        f.has_many :crows, allow_destroy: true do |crow|
          crow.input :ord
          crow.input :offer,
                     :as => :select,
                     :input_html => {:multiple => false},
                     :collection => C80Catoffers::Offer.all.map { |o| ["#{o.title} (#{o.price})", o.id]}

        end
      end

    end

    f.actions
  end

end