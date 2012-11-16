module Xavier


  class Square

    attr_accessor :piece
    attr_reader :rank, :file


    def initialize( window, model )
      @model = model
      @window, @rank, @file = window, @model.rank, @model.file
      deselect
      @color = (rank + file_number) % 2 == 0 ? :black : :white
      @sprite = Gosu::Image.new(@window, "lib/xavier/sprites/#{@color}.png", true)
      @select_sprite = Gosu::Image.new(@window, "lib/xavier/sprites/selected.png", true)
      build_piece
    end

    def build_piece
      return nil if !@model.piece
      @piece = Piece.new(@window, @model.piece)
    end

    def file_number
      ('a' .. 'h').to_a.index(file) + 1
    end

    def select
      @selected = true
    end

    def deselect
      @selected = false
    end


    def draw

      x = (self.file_number - 1) * 100
      mirror_rank = 9 - rank
      y = (mirror_rank - 1) * 100
      @sprite.draw( x , y , 1)

      self.piece.draw(self) if self.piece
      @select_sprite.draw( x,y , 4) if @selected
    end

  end
end
