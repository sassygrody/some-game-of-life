# frozen_string_literal: true

require_relative "../app/game"

RSpec.describe Game do
  describe "init" do
    context "with seeds" do
      let(:seed_cells) { [{ row: 5, col: 20 }] }
      subject { described_class.new(seed_cells) }

      it "creates a board to fit the live seed cells" do
        expect(subject.board.length).to eq(20)
        expect(subject.board[0].length).to eq(20)
      end
    end

    context "without seeds" do
      subject { described_class.new }

      it "displays the grid with default size" do
        expect(subject.board).to eq([
                                      ["-", "-", "-"],
                                      ["-", "-", "-"],
                                      ["-", "-", "-"]
                                    ])
      end
    end
  end

  describe "#run" do
    context "without seed cells" do
      subject { described_class.new }

      it "displays the grid with no active cells (+ buffer)" do
        subject.run
        expect(subject.board).to eq([["-", "-", "-", "-", "-"],
                                     ["-", "-", "-", "-", "-"],
                                     ["-", "-", "-", "-", "-"],
                                     ["-", "-", "-", "-", "-"],
                                     ["-", "-", "-", "-", "-"]])
      end
    end

    context "with seed cells" do
      subject { described_class.new([{ row: 1, col: 1 }]) }

      it "updates the board with active cells (+ buffer" do
        subject.run
        expect(subject.board).to eq([["-", "-", "-", "-", "-"],
                                     ["-", "-", "-", "-", "-"],
                                     ["-", "-", "+", "-", "-"],
                                     ["-", "-", "-", "-", "-"],
                                     ["-", "-", "-", "-", "-"]])
      end
    end

    describe "#update_cell_in_board" do
      subject { described_class.new([{ row: 1, col: 1 }]) }
      xit "should update the board with new iteration of active cells" do
        subject.run
        expect(subject.board).to eq([["-", "-", "-", "-", "-"],
                                     ["-", "+", "-", "-", "-"],
                                     ["-", "-", "-", "-", "-"],
                                     ["-", "-", "-", "-", "-"],
                                     ["-", "-", "-", "-", "-"]])
        subject.send(:update_board!)
        expect(subject.board).to eq([["-", "-", "-", "-", "-"],
                                     ["-", "-", "-", "-", "-"],
                                     ["-", "-", "-", "-", "-"],
                                     ["-", "-", "-", "-", "-"],
                                     ["-", "-", "-", "-", "-"]])
      end

      it "checks if an active cell should be killed" do
      end

      it "check if a dead cell should be activated" do
      end
    end
  end
end
