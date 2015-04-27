require 'spec_helper'

describe TaxCalculator do

  let(:income_details) { {} }
  let(:tax_credits) { {} }
  subject(:tax_calculator) { TaxCalculator.new(income_details, tax_credits) }

  describe '#initialize' do

    [1, 3737, 1234].each do |rfb|
      context "when reportable fringe benefits are #{rfb}" do
        let(:income_details) { {:reportable_fringe_benefits => rfb} }
        it 'raises an error' do
          expect { tax_calculator }.to raise_error
        end
      end
    end
  end

  describe '#total_tax_payable' do
    # See https://www.ato.gov.au/Individuals/Income-and-deductions/How-much-income-tax-you-pay/Individual-income-tax-rates/

    {18200 => 0, 37000 => 3572, 80000 => 17547, 180000 => 54547}.each do |income, tax|
      context "when taxable income is at the top of its bracket (#{income})" do
        let(:income_details) { {:taxable_income => income} }

        it "is the base tax of the next bracket (#{tax})" do
          expect(tax_calculator.total_tax_payable).to be_within(0.001).of(tax)
        end
      end
    end

    {1 => 0, 18201 => 0.19, 37001 => 3572.325, 80001 => 17547.37, 180001 => 54547.45}.each do |income, tax|
      context "when taxable income (#{income}) is at the bottom of its bracket" do
        let(:income_details) { {:taxable_income => income} }

        it "is the base tax of the next bracket plus the rate (#{tax})" do
          expect(tax_calculator.total_tax_payable).to be_within(0.001).of(tax)
        end
      end
    end

    {12000 => 0, 26500 => 1577, 53500 => 8934.5, 135463 => 38068.31, 500000 => 198547}.each do |income, tax|
      context "when taxable income is inside its bracket" do
        let(:income_details) { {:taxable_income => income} }

        it "is #{tax}" do
          expect(tax_calculator.total_tax_payable).to be_within(0.001).of tax
        end
      end
    end

  end

  describe '#net_tax_payable' do

    context 'when there are no tax credits' do
      before { allow(tax_calculator).to receive(:total_tax_payable).and_return(100000) }

      it 'is the same as total tax payable' do
        expect(tax_calculator.net_tax_payable).to be_within(0.001).of 100000
      end
    end

    context 'when there are tax credits' do
      let(:tax_credits) { {:payg_installments => 23000, :franking_tax_offset => 1200} }

      before { allow(tax_calculator).to receive(:total_tax_payable).and_return(39614) }

      it 'is the total tax payable minus the sum of the tax credits' do
        expect(tax_calculator.net_tax_payable).to be_within(0.001).of 15414
      end
    end
  end

end