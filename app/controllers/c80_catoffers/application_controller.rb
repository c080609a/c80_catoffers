require 'c80_lazy_images'

module C80Catoffers
  class ApplicationController < ActionController::Base

    helper C80LazyImages::Engine.helpers

    def offers_guru
      respond_to do |format|
        format.js
      end
    end

    def fake_main

    end

  end
end
