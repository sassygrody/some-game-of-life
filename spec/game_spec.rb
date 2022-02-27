# frozen_string_literal: true

require_relative "../app/game"

RSpec.describe Game do
  describe "#run" do
    describe "big board size" do
      let(:seed_cells) { [{ row: 5, col: 20 }] }
      subject { described_class.new(seed_cells) }

      it "builds the columns +1 greater than largest column size" do
        expect(subject.board.length).to eq(21)
      end

      it "builds the rows +1 greater than largest column size" do
        expect(subject.board[0].length).to eq(21)
      end
    end

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
