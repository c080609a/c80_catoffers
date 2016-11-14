# rake db:seed:c80_catoffers_01_fill_props

C80Catoffers::Prop.delete_all
C80Catoffers::Prop.create!({
                               per_row:         3,
                               preview_width:   80,     # NOTE:: размер иконки в iconed списке # NOTE:: [x090] синхронизировано с css
                               preview_height:  50,    # NOTE:: размер иконки в iconed списке # NOTE:: [x090] синхронизировано с css
                               big_one_width:   621,     # NOTE:: [x090] синхронизировано с css
                               big_one_height:  377,    # NOTE:: [x090] синхронизировано с css
                               thumb_sm_width:  80,     # NOTE:: просто стандартный размер
                               thumb_sm_height: 50,     # NOTE:: просто стандартный размер
                               thumb_md_width:  250,     # NOTE:: просто стандартный размер
                               thumb_md_height: 160,     # NOTE:: просто стандартный размер
                               thumb_lg_width:  1000,     # NOTE:: просто стандартный размер
                               thumb_lg_height: 550,    # NOTE:: просто стандартный размер
                               positions_count: 4,
                               per_page:        6       # сколько Предложений вывести в хелпере render_offers_page
                           })