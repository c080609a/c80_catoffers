class C80CatoffersCreateOffers < ActiveRecord::Migration
  def change
    create_table :c80_catoffers_offers, :options => 'COLLATE=utf8_unicode_ci' do |t|
      t.integer :ord
      t.string :title
      t.string :slug
      t.string :price
      t.text :short_desc
      t.text :desc

      t.timestamps null: false
    end
  end
end
