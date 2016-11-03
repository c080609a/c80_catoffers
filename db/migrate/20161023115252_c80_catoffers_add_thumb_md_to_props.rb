class C80CatoffersAddThumbMdToProps < ActiveRecord::Migration
  def change
    add_column :c80_catoffers_props, :thumb_md_width, :integer
    add_column :c80_catoffers_props, :thumb_md_height, :integer
    add_column :c80_catoffers_props, :thumb_lg_width, :integer
    add_column :c80_catoffers_props, :thumb_lg_height, :integer
  end
end
