module Xavier

  class Peace

    def initialize( window, color, type )
      @window, @color, @type = window, color, type
      @sprite = Gosu::Image.new(@window, "lib/xavier/sprites/#{@color}_#{@type}.png", true)
    end


    def draw( square )
      scale = 0.8
      offset = ( 100 - ( 100 * scale ) ) / 2
      x = (square.row - 1) * 100 + offset + 13
      y = (square.file - 1) * 100 + offset - 17
      @sprite.draw( x , y , 2,scale, scale)
    end

  end
end
