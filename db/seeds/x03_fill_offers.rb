# rake db:seed:x03_fill_offers

C80Catoffers::Offer.delete_all
C80Catoffers::Offer.create!([
                               {
                                   id:1,
                                   ord:20,
                                   title:'Фотоуслуги'
                               },
                               {
                                   id:2,
                                   ord:20,
                                   title:'Фотокурсы'
                               },
                               {
                                   id:3,
                                   ord:30,
                                   title:'Услуги визажиста'
                               }
                           ])