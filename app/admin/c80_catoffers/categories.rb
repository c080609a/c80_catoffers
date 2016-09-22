ActiveAdmin.register C80Catoffers::Category, as: 'Category' do

  menu :label => 'Категории', # TODO_MY:: название пункта меню перенесести в параметры в базу
       priority: 1,
       parent: 'Услуги'# TODO_MY:: название пункта меню перенесести в параметры в базу

  permit_params :title,
                :slug,
                :parent_category_id

  config.per_page = 100
  batch_action :destroy, false
  config.sort_order = 'ord_asc'
  before_filter :skip_sidebar!, :only => :index

  index do
    selectable_column
    column :title
    column :parent_category
    column :child_categories do |cat|
      res = ""
      if cat.child_categories.count > 0
        cat.child_categories.map do |subcat|
          res += "#{subcat.title}<br>"
        end
      end
      res.html_safe
    end
    actions
  end

  form(:html => {:multipart => true}) do |f|

    f.inputs 'Свойства' do
      f.input :title
      f.input :parent_category,
              :as => :select,
              :input_html => {
                  :class => 'selectpicker',
                  'data-size' => "10",
                  'data-width' => '400px',
                  :multiple => false
              }
    end

    f.actions
  end

end