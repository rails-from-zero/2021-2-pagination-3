require 'rails_helper'

RSpec.describe ApplicationHelper do
  describe "#paginate" do
    subject(:paginate) { helper.paginate(posts) }

    let(:posts) {
      instance_double(
        Post::PaginationResult, total_pages: 3, current_page: current_page
      )
    }
    let(:calculator) {
      instance_double(RenderablePagesCalculator, numbers: [1, nil, 3])
    }
    let(:current_page) { 2 }

    before do
      allow(RenderablePagesCalculator)
        .to receive(:new).and_return(calculator)
    end

    it { is_expected.to include('<a href="/posts?page=3">next</a>') }

    it { is_expected.to include('<a href="/posts?page=1">previous</a>') }

    it { is_expected.to include('<a href="/posts?page=1">1</a>') }

    it { is_expected.to include('<a href="/posts?page=3">3</a>') }

    context "on first page" do
      let(:current_page) { 1 }

      it { is_expected.to_not match(%r{<a(.*)?>previous</a>}) }
    end

    context "on last page" do
      let(:current_page) { 3 }

      it { is_expected.to_not match(%r{<a(.*)?>next</a>}) }
    end
  end
end
