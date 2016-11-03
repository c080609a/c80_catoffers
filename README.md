# C80Catoffers

Welcome to your new gem! In this directory, you'll find the files you need to be able to package up your Ruby library into a gem. Put your Ruby code in the file `lib/c80_catoffers`. To experiment with that code, run `bin/console` for an interactive prompt.

TODO: Delete this and the text above, and describe your gem

## Installation

Add this line to your application's Gemfile:

```ruby
    gem 'c80_lazy_images', '0.1.0'
    gem 'c80_catoffers'
```

```scss
    @import "c80_catoffers";
    @import "c80_catoffers_backend";
```

Host app's `application_controller.rb`:
```
      helper C80LazyImages::Engine.helpers
      helper C80Catoffers::Engine.helpers
```

## Usage: helpers

```
render_offer_full_desc(offer_tag)
render_offers_list_by_cat(category_tag)
render_offers_list_grouped
render_offers_list_iconed(css_style:'default', thumb_size:'thumb_sm')

```

