module Xavier


  class Main < Gosu::Window

    def initialize
      super 800,800, false
      self.caption = 'Xavier - Chess Master'
      @squares = {}
      @game = Outpost::Board.new
      puts @game.squares.select{ |p| p.piece }.map{|p|p.piece.class}
      build_board
    end

    # Display cursor
    def needs_cursor?
      true
    end

    def build_board
      @game.squares.each do |s|
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
      @selected = @squares["#{file}#{rank}"]
      if @selected.model.piece
      @squares.each{|k,s| s.deselect; s.unmark}
      @selected.select if @selected
      moves = @game.squares.map{|s| s.notation}
      moves.each{|m| @squares[m].mark }
    end

    def move rank, file
      to = @squares["#{file}#{rank}"]
      to.model.piece = @selected.model.piece
      @selected.model.piece = nil
      @squares.each{|k,s| s.deselect; s.unmark}
      @selected = nil
    end

  end
end
