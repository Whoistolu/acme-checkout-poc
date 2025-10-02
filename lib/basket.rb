class Basket
  def initialize(catalogue:, delivery_calculator:, offers: [])
    @catalogue = catalogue
    @delivery_calculator = delivery_calculator
    @offers = offers
    @items = []
  end

  def add(code)
    @items << @catalogue.find(code)
  end

  def total
    subtotal = @items.sum(&:price)
    discount = @offers.sum { |offer| offer.apply(@items) }
    delivery = @delivery_calculator.calculate(subtotal - discount)
    (subtotal - discount + delivery).round(2)
  end
end
