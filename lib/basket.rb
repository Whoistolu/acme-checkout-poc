# frozen_string_literal: true

require 'bigdecimal'

class Basket
  def initialize(catalogue:, delivery_calculator:, offers: [])
    @catalogue = catalogue
    @delivery_calculator = delivery_calculator
    @offers = offers
    @items = []
  end

  def add(code)
    @items << code
  end

  def total
    subtotal = @items.sum { |code| @catalogue.find(code).price }

    discount = @offers.sum { |offer| offer.apply(@items, @catalogue) }

    delivery = @delivery_calculator.calculate(subtotal - discount)

    total = subtotal - discount + BigDecimal(delivery.to_s)
    total.round(2).to_f
  end
end
