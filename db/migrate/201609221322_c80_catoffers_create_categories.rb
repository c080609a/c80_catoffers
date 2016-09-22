class C80CatoffersCreateCategories < ActiveRecord::Migration
  def change
    create_table :c80_catoffers_categories, :options => 'COLLATE=utf8_unicode_ci' do |t|
      t.integer :ord
      t.string :title
      t.string :slug
      t.text :desc

      t.timestamps null: false
    end
  end
end
