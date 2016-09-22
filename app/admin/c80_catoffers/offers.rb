ActiveAdmin.register C80Catoffers::Offer, as: 'Offer' do

  config.per_page = 100

  menu :label => 'Список услуг', # TODO_MY:: название пункта меню перенесести в параметры в базу
       priority: 2,
       parent: 'Услуги'# TODO_MY:: название пункта меню перенесести в параметры в базу

  permit_params :title,
                :price,
                :short_desc,
                :desc,
                :ophotos_attributes => [:id, :image, :_destroy],
                :astatus_ids => []

  batch_action :destroy, false

  config.sort_order = 'id_asc'

  # before_filter :skip_sidebar!, :only => :index

  index do
    selectable_column
    column :title
    column :price
    column :short_desc
    column :ophoto do |offer|
      if offer.ophotos.count > 0
        link_to image_tag(offer.ophotos.first.image.thumb_fit, style: 'width:150px;'), offer.ophotos.first.image.url, target: '_blank'
      end
    end
    column :desc do |offer|
      offer.desc.html_safe if offer.desc.present?
    end
    actions
  end

  form(:html => {:multipart => true}) do |f|

    f.inputs 'Свойства' do

      f.input :title
      f.input :categories,
              :as => :select,
              :include_blank => true,
              :input_html => {
                  :class => 'selectpicker',
                  'data-size' => "10",
                  'data-width' => '400px',
                  :multiple => false
              }

      f.input :price
      f.input :short_desc
      f.input :desc, :as => :ckeditor, input_html: {:ckeditor => {:height => 410}}

      f.has_many :ophotos, :allow_destroy => true do |gp|
        gp.input :image,
                 :as => :file,
                 :hint => image_tag(gp.object.image.thumb_fit)
      end

    end

    f.actions
  end

end