module Xavier


  class Square

    def initialize( window, row, file )
      @window, @row, @file = window, row, file
      @color = (row + file) % 2 == 0 ? :white : :black
      puts @color
      @sprite = Gosu::Image.new(@window, "lib/xavier/sprites/#{@color}.png", true)
    end


    def draw
      @sprite.draw( (@row - 1) * 100 , (@file - 1) * 100, 1)
    end

  end
end
