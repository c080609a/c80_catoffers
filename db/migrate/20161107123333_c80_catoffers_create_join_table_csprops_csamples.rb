class C80CatoffersCreateJoinTableCspropsCsamples < ActiveRecord::Migration
  def change
    create_table :c80_catoffers_csamples_csprops, :id => false do |t|
      t.integer :csprop_id, :null => false
      t.integer :csample_id, :null => false
    end

    add_index :c80_catoffers_csamples_csprops, [:csprop_id, :csample_id], :unique => true, :name => 'my_index_23'

  end
end
