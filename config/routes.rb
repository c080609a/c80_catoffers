C80Catoffers::Engine.routes.draw do

  root to: 'application#fake_main' # NOTE:: добавлен только чтобы работал UrlsHelper
  match 'offers_guru', :to => 'application#offers_guru', :via => :post

end
