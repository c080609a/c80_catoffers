# rake db:seed:c80_catoffers_01_fill_props

C80Catoffers::Prop.delete_all
C80Catoffers::Prop.create!({
                               per_row:3,
                               preview_width:250, # NOTE:: [x090] синхронизировано с css
                               preview_height:164, # NOTE:: [x090] синхронизировано с css
                               big_one_width:621, # NOTE:: [x090] синхронизировано с css
                               big_one_height: 377, # NOTE:: [x090] синхронизировано с css
                               thumb_sm_width:80,
                               thumb_sm_height: 50,
                               positions_count: 4
                           })