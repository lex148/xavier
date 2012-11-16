module Xavier


  class Square

    attr_accessor :peace
    attr_reader :row, :file


    def initialize( window, row, file )
      @window, @row, @file = window, row, file
      @color = (row + file) % 2 == 0 ? :white : :black
      @sprite = Gosu::Image.new(@window, "lib/xavier/sprites/#{@color}.png", true)
    end


    def draw
      @sprite.draw( (@row - 1) * 100 , (@file - 1) * 100, 1)
      self.peace.draw(self) if self.peace
    end

  end
end
