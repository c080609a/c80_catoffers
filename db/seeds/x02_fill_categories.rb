# rake db:seed:x02_fill_categories

C80Catoffers::Category.delete_all
C80Catoffers::Category.create!([
                                   {title: 'Фотоуслуги',
                                    id: 10,
                                    ord: 10
                                   },
                                   {title: 'Печать',
                                    id: 20,
                                    ord: 20
                                   },
                                   {title: 'Фотокурсы',
                                    id: 30,
                                    ord: 30
                                   },
                                   {title: 'Услуги визажиста',
                                    id: 40,
                                    ord: 40
                                   },

                                   {title: 'Сканирование',
                                    id: 100,
                                    ord: 100,
                                    parent_category_id: 20
                                   },
                                   {title: 'Цветная печать',
                                    id: 110,
                                    ord: 110,
                                    parent_category_id: 20
                                   },
                                   {title: 'Копирование и печать чертежей',
                                    id: 120,
                                    ord: 120,
                                    parent_category_id: 20
                                   },
                                   {title: 'Багетирование',
                                    id: 130,
                                    ord: 130,
                                    parent_category_id: 20
                                   }
                               ])
