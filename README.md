# Acme Widget Co – Basket POC

Proof-of-concept sales system for Acme Widget Co.
This project is written in Ruby and demonstrates key software engineering practices:

- **Dependency injection**
- **Strategy pattern**
- **Extensible design**


## Setup

1. Clone the repo
   ```ruby
   git clone https://github.com/Whoistolu/acme-checkout-poc
   ```
   ```ruby
   cd acme-checkout-poc
   ```

2. Install dependencies (RSpec for testing)
    ```
    bundle install
    ```

3. Run the RSpec test suite:
     ```
    rspec spec/basket_spec.rb
    ```

## Current Implementation

### Core Domain

- Product – represents a product with code, name, and price.

- ProductCatalogue – provides product lookup by code.

- Basket – allows adding items and calculating totals.

- DeliveryRule & DeliveryCalculator – encapsulate delivery charges based on basket total.

### Design Goals

- Rules and calculators are injected for flexibility.

- Extensible to support discounts, pricing strategies, or new delivery rules without rewriting basket logic.

## Features Implemented

- **Product & ProductCatalogue** – define and look up products by code.
- **Delivery Rules & DeliveryCalculator** – tiered delivery charges based on basket subtotal.
- **RedWidgetHalfPriceOffer** – “buy one red widget, get the second half price” offer.
- **Basket** – main class that supports:
  - Adding items by product code
  - Calculating totals with offers and delivery rules applied
- **RSpec Tests** – verifying basket totals against expected scenarios.

## Final Notes & Assumptions

- **Money Handling**: All prices and calculations use `BigDecimal` to avoid floating point rounding errors.  
- **Delivery Rules**: Rules are order-independent and applied by checking thresholds in ascending order. Orders of $90 or more result in free delivery by default.  
- **Offers**: The implementation uses the Strategy pattern. Each offer is encapsulated in its own class with an `apply` method, making it easy to add or remove offers without changing basket logic.  
- **Basket Responsibility**: The basket only coordinates product lookups, delivery calculation, and offer application. It does not contain hard-coded pricing logic, keeping it extensible.  
- **Error Handling**: Adding an unknown product code raises an `ArgumentError`.  
- **Proof of Concept Scope**: This project is to demonstrate Ruby, encapsulation, dependency injection, and extensible design patterns.  


# 👤 **Author**
 - GitHub: [@githubhandle](https://github.com/Whoistolu)


