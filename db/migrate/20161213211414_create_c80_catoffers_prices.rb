class CreateC80CatoffersPrices < ActiveRecord::Migration
  def change
    create_table :c80_catoffers_prices, :options => 'COLLATE=utf8_unicode_ci' do |t|
      t.string :title
      t.string :file

      t.timestamps null: false
    end
  end
end
