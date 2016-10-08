class C80CatoffersAddPositionsCountToProps < ActiveRecord::Migration
  def change
    add_column :c80_catoffers_props, :positions_count, :integer
  end
end
