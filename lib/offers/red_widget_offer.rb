# frozen_string_literal: true

require_relative 'offer'

class RedWidgetOffer < Offer
  RED_CODE = 'R01'

  def apply(items, catalogue)
    red_count = items.count(RED_CODE)
    return BigDecimal('0') if red_count < 2

    red_price = catalogue.find(RED_CODE).price
    pairs = red_count / 2

    (pairs * (red_price / 2)).round(2)
  end
end
