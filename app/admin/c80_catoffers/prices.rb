ActiveAdmin.register C80Catoffers::Price, as: 'Price' do

  menu :label => 'Прайсы', # TODO_MY:: название пункта меню перенесести в параметры в базу
       priority: 3,
       parent: 'Услуги' # TODO_MY:: название пункта меню перенесести в параметры в базу

  permit_params :title,
                :file

  batch_action :destroy, false

  before_filter :skip_sidebar!, :only => :index

  index do
    column :title
    column :file do |price|
      link_to price.file, price.file.url, { :target => '_blank' }
    end
    actions
  end

  form(:html => {:multipart => true}) do |f|
    f.inputs 'Свойства' do

      f.input :title
      f.input :file,
              :as => :file,
              :hint => f.object.file.url #f.template.asset_url(f.object.file.url)

    end
    f.actions
  end

end