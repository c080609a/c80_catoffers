class C80CatoffersCreateProps < ActiveRecord::Migration
  def change
    create_table :c80_catoffers_props, :options => 'COLLATE=utf8_unicode_ci' do |t|

      # количество услуг в одном ряду (в списке услуг)
      t.integer :per_row

      # размеры картинки в списке услуг
      t.integer :preview_width
      t.integer :preview_height

      # размеры большой картинки на странице просмотра услуги
      t.integer :big_one_width
      t.integer :big_one_height

      t.timestamps null: false
    end
  end
end
