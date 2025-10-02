require_relative "offer"

class RedWidgetOffer < Offer
  RED_CODE = "R01"

  def apply(items)
    red_widgets = items.select { |p| p.code == RED_CODE }
    pairs = red_widgets.count / 2
    return 0.0 if red_widgets.empty?

    (red_widgets.first.price / 2) * pairs
  end
end
