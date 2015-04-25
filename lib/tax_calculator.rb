class TaxCalculator

  # If this were a real working class I'd use the Money gem (http://rubymoney.github.io/money/) for values, not integers and floats

  TAX_BRACKETS = {180000 => 0.45, 80000 => 0.37, 37000 => 0.325, 18200 => 0.19}

  def initialize(income_details, tax_credits)
    @taxable_income = income_details[:taxable_income] || 0
    @tax_credits = tax_credits || 0
    @reportable_fringe_benefits  = income_details[:reportable_fringe_benefits] || 0
    if @reportable_fringe_benefits > 0 && @reportable_fringe_benefits <= 3737
      raise "Total reportable fringe benefits must be more than $3737. If you have entered less than $3738, please enter $0 to proceed."
    end
  end

  def total_tax_payable
    tax = 0
    ceiling = [@taxable_income, TAX_BRACKETS.keys.first].max
    TAX_BRACKETS.each do | floor, rate |
      tax = tax + bracket_tax(ceiling, floor, rate) if @taxable_income > floor
      ceiling = [floor, @taxable_income].min
    end
    tax
  end

  def net_tax_payable
    total_tax_payable - sum_of_tax_credits
  end

  private

  def bracket_tax(ceiling, floor, rate)
    (ceiling - floor) * rate
  end

  def sum_of_tax_credits
    @tax_credits.values.inject(0) { |sum, value| value + sum}
  end

end