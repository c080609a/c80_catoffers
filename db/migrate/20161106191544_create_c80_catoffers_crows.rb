class CreateC80CatoffersCrows < ActiveRecord::Migration
  def change
    create_table :c80_catoffers_crows, :options => 'COLLATE=utf8_unicode_ci' do |t|
      t.integer :ord
      t.references :csample, index: true
      t.references :offer, index: true

      t.timestamps null: false
    end
    # add_foreign_key :c80_catoffers_crows, :csamples
    # add_foreign_key :c80_catoffers_crows, :offers
  end
end
