ActiveAdmin.register C80Catoffers::Csprop, as: 'Csprop' do

  config.per_page = 100

  menu :label => 'Настройки рассчёта стоимости', # TODO_MY:: название пункта меню перенесести в параметры в базу
       priority: 5,
       parent: 'Услуги' # TODO_MY:: название пункта меню перенесести в параметры в базу

  permit_params :csample_ids => []

  batch_action :destroy, false

  config.sort_order = 'id_asc'

  before_filter :skip_sidebar!, :only => :index

  index do
    # selectable_column
    column 'Список который выводится в виджете' do |csprop|
      res = ''
      csprop.csamples.map do |csample|
        res += "<li>#{csample.title}</li>"
      end
      "<ul>#{res}</ul>".html_safe
    end
    actions
  end

  form(:html => {:multipart => true}) do |f|

    f.inputs 'Список который выводится в виджете' do

      f.input :csamples,
              :as => :check_boxes

    end

    f.actions
  end

end