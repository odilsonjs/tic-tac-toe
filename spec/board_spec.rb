require_relative '../lib/board'
require_relative '../lib/player'

describe verify('X', 'X', 'X') do
  context "when the board reads X X X across one row, columns or diagonal" do
    it "returns true" do
        expect(verify('X', 'X', 'X')).to be true
    end
  end

  context "when the board reads X X O across one row, columns or diagonal" do
      it "returns false" do
          expect(verify('X', 'X', 'O')).to be false
    end
  end

  context "when the board reads O O O across one row, columns or diagonal" do
    it "returns true" do
        expect(verify('O', 'O', 'O')).to be true
    end
  end
end

describe Board do
    describe "We test when someone has'nt win yet" do
        before do
            class Board
                def self.create_board
                    @@board = {
                    1 => 1, 2 => 2, 3 => 3,
                    4 => 4, 5 => 5, 6 => 6,
                    7 => 7, 8 => 8, 9 => 9
                    }
                    @@numbers_already_choosed = []
                end
            end
            Board.create_board
        end
        context "returns False because any three elements on the rows, columns and diagonals are same" do
            it "returns false that means nobody wins yet" do
                expect(Board.check_victory).to be false
            end
        end
    end

    describe "We test when someone wins" do
        before do
            class Board
                def self.create_board
                    @@board = {
                    1 => 1, 2 => 2, 3 => 3,
                    4 => 4, 5 => 5, 6 => 6,
                    7 => 'X', 8 => 'X', 9 => 'X'
                    }
                    @@numbers_already_choosed = []
                end
            end
            Board.create_board
        end
    
        context "returns True because there is three elements on a row, a column or diagonal which same" do
            it "returns True that means someone wins" do
                expect(Board.check_victory).to be true
            end
        end
    end

    describe "We test the #set_board method, when a player plays so the board can change" do 
        before do
            class Board
                def self.create_board
                    @@board = {
                    1 => 1, 2 => 2, 3 => 3,
                    4 => 4, 5 => 5, 6 => 6,
                    7 => 7, 8 => 8, 9 => 9
                    }
                    @@numbers_already_choosed = []
                end
                def self.board
                    @@board
                end
            end
            Board.create_board
        end
        context "Tom will play and change the third element on the board to his own piece" do
            
            it "#set_board method changes the third element on the board to Tom's piece" do
            # We create an Player instance called Tom
            # The first argument is Tom's name and the second one is Tom's piece
            tom = Player.new("Tom", "X")
            expect { Board.set_board(3, tom) }.to change { Board.board[3] }.from(3).to("X")
            end
        end
    end
end
describe "#is_digit?" do
    describe "The method #is_digit? returns true if the string given in argument is a digit or not" do

        context "When we pass a valid string digit in parameter" do
            it "returns true, because '3' is a valid string digit" do
                valid_digit = '3'
                expect(is_digit?(valid_digit)).to be true
            end
        end

        context "When we pass a invalid digit in parameter" do
            it "returns false because 8 is a Integer not a string digit" do
                invalid_digit = 8
                expect(is_digit?(invalid_digit)).to be false
            end
        end

        context "When we pass a letter in parameter" do
            it "returns false because letter isn't a digit" do
                letter = 'K'
                expect(is_digit?(letter)).to be false
            end
        end
    end
end