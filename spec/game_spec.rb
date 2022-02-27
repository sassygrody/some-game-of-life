# frozen_string_literal: true

require_relative "../app/game"

RSpec.describe Game do
  describe "#run" do
    context "without seed cells" do
      subject { described_class.new }

      it "displays the grid with no live cells" do
        subject.run
        expect(subject.board).to eq([["-", "-", "-"], ["-", "-", "-"], ["-", "-", "-"]])
      end
    end

    context "with seed cells" do
      subject { described_class.new([{ row: 0, col: 0 }]) }

      it "updates the board with live cells" do
        subject.run
        expect(subject.board).to eq([["+", "-", "-"], ["-", "-", "-"], ["-", "-", "-"]])
      end
    end
  end
end
