class C80CatoffersCreateOphotos < ActiveRecord::Migration
  def change
    create_table :c80_catoffers_ophotos, :options => 'COLLATE=utf8_unicode_ci' do |t|
      t.string :image
      t.references :offer

      t.timestamps null: false
    end
  end
end
