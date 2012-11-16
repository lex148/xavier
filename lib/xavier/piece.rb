module Xavier

  class Piece

    def initialize( window, color, type )
      @window, @color, @type = window, color, type
      file = "lib/xavier/sprites/#{@color}_#{@type}.png"
      @sprite = Gosu::Image.new(@window, file, true)
    end

    def draw( square )
      scale = 0.7
      offset = ( 100 - ( 100 * scale ) ) / 2

      x = (square.file_number - 1) * 100 + offset + 10
      mirror_rank = 9 - square.rank
      y = (mirror_rank - 1) * 100

      @sprite.draw( x , y , 2,scale, scale)
    end

  end
end
