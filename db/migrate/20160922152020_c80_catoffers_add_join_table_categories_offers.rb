class C80CatoffersAddJoinTableCategoriesOffers < ActiveRecord::Migration
  def change
    create_table :c80_catoffers_categories_offers, :id => false do |t|
      t.integer :category_id, :null => false
      t.integer :offer_id, :null => false
    end

    add_index :c80_catoffers_categories_offers, [:offer_id, :category_id], :unique => true, :name => 'my_index'

  end
end
