class DeliveryRule
  attr_reader :threshold, :charge

  def initialize(threshold:, charge:)
    @threshold = threshold
    @charge = charge
  end

  def applicable?(total)
    total < threshold
  end
end
