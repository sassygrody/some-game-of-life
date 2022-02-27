# frozen_string_literal: true

require_relative "../app/game"

RSpec.describe Game do
  describe "#run" do
    context "without seed cells" do
      subject { described_class.new }

      it "displays the grid with no live cells" do
        expect(subject.run).to eq(["- - -", "- - -", "- - -"])
      end
    end

    context "with seed cells" do
      subject { described_class.new([{ row: 0, col: 0 }]) }

      it "displays the grid with live cells" do
        expect(subject.run).to eq(["+ - -", "- - -", "- - -"])
      end
    end
  end
end
