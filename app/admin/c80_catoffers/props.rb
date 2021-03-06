ActiveAdmin.register C80Catoffers::Prop, as: 'Prop' do

  config.per_page = 100

  menu :label => 'Настройки', # TODO_MY:: название пункта меню перенесести в параметры в базу
       priority: 3,
       parent: 'Услуги' # TODO_MY:: название пункта меню перенесести в параметры в базу

  permit_params :positions_count,
                :offer_ids => []

  batch_action :destroy, false

  config.sort_order = 'id_asc'

  before_filter :skip_sidebar!, :only => :index

  index do
    # selectable_column
    column 'Список который выводится в виджете' do |prop|
      res = ''
      prop.offers.map do |offer|
        res += "<li>#{offer.title}</li>"
      end
      "<ul>#{res}</ul>".html_safe
    end
    column :positions_count
    actions
  end

  form(:html => {:multipart => true}) do |f|

    f.inputs 'Свойства' do

      f.input :offers,
              :as => :check_boxes
      f.input :positions_count

    end

    f.actions
  end

end