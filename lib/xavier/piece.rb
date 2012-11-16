module Xavier

  class Piece

    def initialize( window, color, type )
      @window, @color, @type = window, color, type
      file = "lib/xavier/sprites/#{@color}_#{@type}.png"
      @sprite = Gosu::Image.new(@window, file, true)
    end

    def draw( square )
      scale = 0.8
      offset = ( 100 - ( 100 * scale ) ) / 2
      x = (square.rank - 1) * 100 + offset + 13
      y = (square.file_number - 1) * 100 + offset - 17
      @sprite.draw( x , y , 2,scale, scale)
    end

  end
end
