# rake db:seed:x03_fill_offers

desc_1 = '<p>Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur?</p>'
desc_2 = '<p>Quis autem vel eum iure reprehenderit qui in <strong>ea voluptate velit esse</strong> quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur?</p>
<p>Sed ut perspiciatis unde omnis iste <a href="http://google.com">natus error</a> sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo.</p>'
desc_3 = '<p>Sed ut perspiciatis unde omnis iste <a href="http://google.com">natus error</a> sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo.</p>
<ul>
    <li>aliquam quaerat voluptatem;</li>
    <li>Quis autem vel eum iure reprehenderit;</li>
    <li>Nemo enim ipsam voluptatem quia voluptas;</li>
</ul>'
desc_4 = '<p>Quis autem vel eum iure reprehenderit qui in <strong>ea voluptate velit esse</strong> quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur?</p>
<p>Sed ut perspiciatis unde omnis iste <a href="http://google.com">natus error</a> sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo.</p>
<ul>
    <li>aliquam quaerat voluptatem;</li>
    <li>Quis autem vel eum iure reprehenderit;</li>
    <li>Nemo enim ipsam voluptatem quia voluptas;</li>
</ul>
<h4>De Finibus Bonorum et Malorum</h4>
<p>Duis aute <a href="http://google.com">irure dolor</a> in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? </p>
<blockquote>Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. (Cicero,45 BC)</blockquote>
<p>At vero eos et accusamus et iusto odio <em>dignissimos ducimus</em> qui blanditiis praesentium voluptatum deleniti atque corrupti quos dolores et quas molestias excepturi sint occaecati cupiditate non provident, similique sunt in culpa qui officia deserunt mollitia animi, id est laborum et dolorum fuga. Et harum quidem rerum facilis est et expedita distinctio.</p>'
desc_5 = '<p>Nemo enim <a href="http://google.com">ipsam voluptatem </a> quia voluptas sit voluptatem accusantium doloremque lum.</p>'
desc_6 = '<p>Sed ut perspiciatis unde omnis iste <a href="http://google.com">natus error</a> sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo.</p>
<ul>
    <li>aliquam quaerat voluptatem;</li>
    <li>Quis autem vel eum iure reprehenderit;</li>
    <li>Nemo enim ipsam voluptatem quia voluptas;</li>
</ul>'
desc_7 = '<p>Quis autem vel eum iure reprehenderit qui in <strong>ea voluptate velit esse</strong> quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur?</p>
<p>Sed ut perspiciatis unde omnis iste <a href="http://google.com">natus error</a> sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo.</p>
<ul>
    <li>aliquam quaerat voluptatem;</li>
    <li>Quis autem vel eum iure reprehenderit;</li>
    <li>Nemo enim ipsam voluptatem quia voluptas;</li>
</ul>
<h4>De Finibus Bonorum et Malorum</h4>
<p>Duis aute <a href="http://google.com">irure dolor</a> in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? </p>
'

C80Catoffers::Offer.delete_all
C80Catoffers::Offer.create!([
                                {
                                    id:1,
                                    ord:20,
                                    title:'Установка розеток',
                                    short_desc:'Nemo ipsam nulita lagua voluptatem',
                                    desc: desc_7,
                                    price: '400 руб'
                                },
                                {
                                    id:2,
                                    ord:20,
                                    title:'Установка выключателей',
                                    short_desc:'Deserunt mollitia ipsam',
                                    desc: desc_6,
                                    price: '500 руб'
                                },
                                {
                                    id:3,
                                    ord:30,
                                    title:'Установка internet розетки',
                                    short_desc:'Nemo enim ipsam voluptatem quia',
                                    desc: desc_5,
                                    price: '500 руб'
                                },
                                {
                                    id:4,
                                    ord:40,
                                    title:'Установка TV розетки',
                                    short_desc:'Quis autem vel eum',
                                    desc: desc_4,
                                    price: '400 руб'
                                },
                                {
                                    id:5,
                                    ord:50,
                                    title:'Установка бокса на 12 модулей',
                                    short_desc:'Duis aute irure dolor',
                                    desc: desc_3,
                                    price: '1700 руб'
                                },
                                {
                                    id:6,
                                    ord:60,
                                    title:'Прокладка проводов в штробе',
                                    short_desc:'Deserunt mollitia animi',
                                    desc: desc_2,
                                    price: '1500 руб'
                                },
                                {
                                    id:7,
                                    ord:70,
                                    title:'Установка устройства уравнения потенциалов',
                                    short_desc:'At vero eos et accusamus',
                                    desc: desc_1,
                                    price: '228 руб'
                                }
                            ])