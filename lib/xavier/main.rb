module Xavier


  class Main < Gosu::Window

    def initialize
      super 800,800, false
      self.caption = 'Xavier - Chess Master'
      @sprites = []
      build_board
    end

    # Display cursor
    def needs_cursor?
      true
    end

    def build_board
      (1..8).each do |row|
        (1..8).each do |file|
          @sprites << Square.new(self, row, file)
        end
      end
    end

    def update
    end

    def draw
      @sprites.each{|s| s.draw }
    end

  end
end
