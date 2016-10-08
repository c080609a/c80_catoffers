class C80CatoffersAddThumbSmToProps < ActiveRecord::Migration
  def change
    add_column :c80_catoffers_props, :thumb_sm_width, :integer
    add_column :c80_catoffers_props, :thumb_sm_height, :integer
  end
end
