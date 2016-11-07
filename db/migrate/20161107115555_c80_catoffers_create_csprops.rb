class C80CatoffersCreateCsprops < ActiveRecord::Migration
  def change
    create_table :c80_catoffers_csprops, :options => 'COLLATE=utf8_unicode_ci' do |t|
      t.timestamps null: false
    end
  end
end
