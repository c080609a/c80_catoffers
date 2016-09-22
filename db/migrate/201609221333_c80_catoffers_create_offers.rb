class C80CatoffersCreateOffers < ActiveRecord::Migration
  def change
    create_table :c80_catoffers_offers, :options => 'COLLATE=utf8_unicode_ci' do |t|
      t.string :title
      t.string :price
      t.text :short_desc
      t.text :desc

      t.timestamps null: false
    end
  end
end
