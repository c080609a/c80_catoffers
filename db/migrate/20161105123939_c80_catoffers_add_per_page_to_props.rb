class C80CatoffersAddPerPageToProps < ActiveRecord::Migration
  def change
    add_column :c80_catoffers_props, :per_page, :integer
  end
end
