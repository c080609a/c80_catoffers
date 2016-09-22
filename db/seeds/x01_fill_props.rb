# rake db:seed:x01_fill_props

C80Catoffers::Prop.delete_all
C80Catoffers::Prop.create!({
                               per_row:3,
                               preview_width:250,
                               preview_height:164,
                               big_one_width:500,
                               big_one_height: 350
                           })