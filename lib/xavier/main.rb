module Xavier


  class Main < Gosu::Window

    def initialize
      super 800,800, false
      self.caption = 'Xavier - Chess Master'
      @background_image = Gosu::Image.new(self, "lib/xavier/sprites/board.png", true)
    end

    # Display cursor
    def needs_cursor?
      true
    end

    def update
    end

    def draw
      @background_image.draw(0, 0, 0)
    end

  end
end
