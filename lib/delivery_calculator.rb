class DeliveryCalculator
  def initialize(rules)
    @rules = rules.sort_by(&:threshold)
  end

  def calculate(total)
    rule = @rules.find { |r| r.applicable?(total) }
    rule ? rule.charge : 0.0
  end
end
