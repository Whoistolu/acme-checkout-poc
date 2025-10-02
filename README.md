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

## Current Implementation

### Core Domain

- Product – represents a product with code, name, and price.

- ProductCatalogue – provides product lookup by code.

- Basket – allows adding items and calculating totals.

- DeliveryRule & DeliveryCalculator – encapsulate delivery charges based on basket total.

### Design Goals

- Rules and calculators are injected for flexibility.

- Extensible to support discounts, pricing strategies, or new delivery rules without rewriting basket logic.

### Work in Progress

- RSpec tests (spec/basket_spec.rb) are being added.

- CLI runner (bin/basket) will allow manual play with basket items.

- Minor rounding differences in totals are being resolved.

# 👤 **Author**
 - GitHub: [@githubhandle](https://github.com/Whoistolu)


