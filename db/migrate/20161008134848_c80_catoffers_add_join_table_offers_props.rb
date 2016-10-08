class C80CatoffersAddJoinTableOffersProps < ActiveRecord::Migration
  def change
    create_table :c80_catoffers_offers_props, :id => false do |t|
      t.integer :offer_id, :null => false
      t.integer :prop_id, :null => false
    end

    add_index :c80_catoffers_offers_props, [:offer_id, :prop_id], :unique => true, :name => 'my_index_2'

  end
end
