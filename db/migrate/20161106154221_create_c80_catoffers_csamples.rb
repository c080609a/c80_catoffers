class CreateC80CatoffersCsamples < ActiveRecord::Migration
  def change
    create_table :c80_catoffers_csamples, :options => 'COLLATE=utf8_unicode_ci' do |t|
      t.string :title
      t.string :sub_title
      t.string :csphoto
      t.integer :ord
      t.integer :summ_price

      t.timestamps null: false
    end
  end
end
