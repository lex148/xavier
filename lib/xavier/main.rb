module Xavier


  class Main < Gosu::Window

    def initialize
      super 800,800, false
      self.caption = 'Xavier - Chess Master'
      @squares = {}
      @game = Outpost::Board.new
      build_board
    end

    # Display cursor
    def needs_cursor?
      true
    end

    def build_board
      @game.squares.each do |s|
        @squares[s.notation] = Square.new(self, s.rank, s.file)
      end
      populate
      update_pieces
    end

    def populate
      ( 0 .. @game.pieces.size ).each do |i|
        @game.pieces[i].square = @game.squares[i] if @game.pieces[i]
      end
    end

    def update_pieces
      @squares.each{|k,s| s.piece = nil }
      @game.pieces.each do |p|
        type = p.class.to_s.match(/\w+$/).to_s.downcase.to_sym
        @squares[p.square.notation].piece = Piece.new( self, p.color, type ) if p.square
      end
    end

    def update
    end

    def draw
      @squares.each{|k,s| s.draw }
    end

  end
end
