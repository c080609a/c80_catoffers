require 'c80_lazy_images'

module C80Catoffers
  class ApplicationController < ActionController::Base

    helper C80LazyImages::Engine.helpers

    protect_from_forgery with: :exception

    def offers_guru
      respond_to do |format|
        format.js
      end
    end

    def fake_main

    end

    def price_me
      respond_to do |format|
        format.js
      end
    end

  end
end
