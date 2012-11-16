module Xavier


  class Main < Gosu::Window

    def initialize
      super 800,800, false
      self.caption = 'Xavier - Chess Master'
      @squares = {}
      @game = Outpost::Game.new
      build_board
    end

    # Display cursor
    def needs_cursor?
      true
    end

    def build_board
      @board = @game.board
      @board.squares.each do |s|
        @squares[s.notation] = Square.new(self, s)
      end
    end

    def update
    end

    def draw
      @squares.each{|k,s| s.draw }
    end

    def button_down(id)
      if id == Gosu::MsLeft
        rank = 9 - (mouse_y / 100.0).ceil
        file = ('a'..'h').to_a[(mouse_x / 100.0).ceil - 1]
        if @selected
          move rank, file
        else
          setSelection rank, file
        end
      end
    end

    def setSelection rank, file
      found = @squares["#{file}#{rank}"]
      if found && found.model.piece
        @selected = found
        @squares.each{|k,s| s.deselect; s.unmark}
        @selected.select if @selected
        moves = @selected.model.piece.possible_moves
        #moves = @board.squares.map{|s| s.notation}
        moves.each{|m| @squares[m.notation].mark }
      end
    end

    def move rank, file
      if @selected.model.piece
        to = @squares["#{file}#{rank}"]
        @game.move @selected.model.piece, to.model if to.model
        build_board
      end
      @selected = nil
    end

  end
end
