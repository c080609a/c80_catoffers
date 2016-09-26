module C80Catoffers
  module AppHelper

    def render_offer_full_desc(offer_tag)

      offer = Offer.where(:slug => offer_tag).first

      if offer.present?
        render :partial => 'c80_catoffers/offer_full_desc',
               :locals => {
                   :frames => offer.ophotos,
                   :image_alt => offer.title,
                   :desc => offer.desc,
                   :price => offer.price,
                   :order_button_label => 'Оставить заявку',
                   :predefined_text_in_order_form => "Добрый день! Оставляю заявку на услугу '#{ offer.title }'.",
                   :subj_id => offer.id
               }
      end

    end

  end
end