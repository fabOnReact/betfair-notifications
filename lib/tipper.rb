class Tipper
  TAX = 0.05

  def initialize(amount:, discount_percentage: 0, tip_percentage:)
    @amount = amount
    @discount_percentage = discount_percentage
    @tip_percentage = tip_percentage
  end

	def tax_amount
    @amount * TAX
	end

	def discount_amount
    @amount * (discount_percentage / 100.0)
	end

	def tip_amount
    @amount * (tip_percentage / 100.0)
	end

  def total
    amount + tax_amount - discount_amount + tip_amount
  end

  private

  attr_reader :amount, :discount_percentage, :tip_percentage 
end
