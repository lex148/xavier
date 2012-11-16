module Xavier

  class Peace

    def initialize( window, color, type )
      @window, @color, @type = window, color, type
      @sprite = Gosu::Image.new(@window, "lib/xavier/sprites/#{@color}_#{@type}.png", true)
    end


    def draw( square )
      @sprite.draw( (square.row - 1) * 100 , (square.file - 1) * 100, 2)
    end

  end
end
