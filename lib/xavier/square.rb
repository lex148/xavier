module Xavier


  class Square

    def initialize( row, file )
      @row, @file = row, file
      @color = row + file % 2 == 0 ? :white : :black
      @sprite = Gosu::Image.new(self, "lib/xavier/sprites/#{@color}.png", true)
    end


    def draw
      @sprite.draw(row * 100, file * 100, 1)
    end

  end
end
