# frozen_string_literal: true

require 'rspec'
require_relative '../lib/product'
require_relative '../lib/product_catalogue'
require_relative '../lib/delivery_rule'
require_relative '../lib/delivery_calculator'
require_relative '../lib/basket'
require_relative '../lib/offers/offer'
require_relative '../lib/offers/red_widget_offer'

RSpec.describe Basket do
  let(:products) do
    [
      Product.new(code: 'R01', name: 'Red Widget', price: 32.95),
      Product.new(code: 'G01', name: 'Green Widget', price: 24.95),
      Product.new(code: 'B01', name: 'Blue Widget', price: 7.95)
    ]
  end

  let(:catalogue) { ProductCatalogue.new(products) }

  let(:delivery_rules) do
    [
      DeliveryRule.new(threshold: 50, charge: 4.95),
      DeliveryRule.new(threshold: 90, charge: 2.95)
    ]
  end

  let(:delivery_calculator) { DeliveryCalculator.new(delivery_rules) }

  let(:basket) do
    Basket.new(catalogue: catalogue, delivery_calculator: delivery_calculator, offers: [RedWidgetOffer.new])
  end

  it 'calculates total for B01, G01' do
    basket.add('B01')
    basket.add('G01')
    expect(basket.total).to eq(37.85)
  end

  it 'calculates total for R01, R01' do
    basket.add('R01')
    basket.add('R01')
    expect(basket.total).to eq(54.37)
  end

  it 'calculates total for R01, G01' do
    basket.add('R01')
    basket.add('G01')
    expect(basket.total).to eq(60.85)
  end

  it 'calculates total for B01, B01, R01, R01, R01' do
    basket.add('B01')
    basket.add('B01')
    basket.add('R01')
    basket.add('R01')
    basket.add('R01')
    expect(basket.total).to eq(98.27)
  end
end
