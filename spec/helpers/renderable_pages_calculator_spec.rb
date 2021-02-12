require 'rails_helper'

RSpec.describe RenderablePagesCalculator do
  let(:calculator) { described_class.new(total_pages, current_page) }
  let(:total_pages) { 15}
  let(:current_page) { 8 }

  describe "#numbers" do
    subject { calculator.numbers }

    let(:expected_numbers) {
      [1, 2, nil, 6, 7, 8, 9, 10, nil, 14, 15]
    }

    it { is_expected.to eql(expected_numbers) }

    context "with current_page near start" do
      let(:current_page) { 2 }
      let(:expected_numbers) {
        [1, 2, 3, 4, nil, 14, 15]
      }

      it { is_expected.to eql(expected_numbers) }
    end

    context "with current_page at end" do
      let(:current_page) { 15 }
      let(:expected_numbers) {
        [1, 2, nil, 13, 14, 15]
      }

      it { is_expected.to eql(expected_numbers) }
    end
  end
end
