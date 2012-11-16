module Xavier


  class Square

    attr_accessor :piece
    attr_reader :rank, :file


    def initialize( window, rank, file )
      @window, @rank, @file = window, rank, file
      @color = (rank + file_number) % 2 == 0 ? :white : :black
      @sprite = Gosu::Image.new(@window, "lib/xavier/sprites/#{@color}.png", true)
    end

    def file_number
      ('a' .. 'h').to_a.index(file) + 1
    end


    def draw
      @sprite.draw( (rank - 1) * 100 , (file_number - 1) * 100, 1)
      self.piece.draw(self) if self.piece
    end

  end
end
