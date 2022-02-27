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

    describe "new_seed_list" do
      let(:seed_cells) do
        [
          { row: 0, col: 0 },
          { row: 0, col: 1 },
          { row: 0, col: 2 },
          { row: 1, col: 1 },
          { row: 1, col: 2 }
        ]
      end
      subject { described_class.new(seed_cells) }

      before do
        subject.run
      end

      it "next seed should be" do
        expect(subject.send(:new_seed_list)).to eq([
                                                     { col: 2, row: 0 },
                                                     { col: 1, row: 1 },
                                                     { col: 3, row: 1 },
                                                     { col: 1, row: 2 },
                                                     { col: 3, row: 2 }
                                                   ])
      end

      it "renders correctly" do
        new_game = described_class.new([
                                         { col: 2, row: 0 },
                                         { col: 1, row: 1 },
                                         { col: 3, row: 1 },
                                         { col: 1, row: 2 },
                                         { col: 3, row: 2 }
                                       ])
        new_game.run
        expect(new_game.board).to eq([
                                               ["-", "-", "-", "-", "-"],
                                               ["-", "-", "-", "+", "-"],
                                               ["-", "-", "+", "-", "+", "-"],
                                               ["-", "-", "+", "-", "+", "-"],
                                               ["-", "-", "-", "-", "-"]
                                             ])
      end
    end
  end
end
