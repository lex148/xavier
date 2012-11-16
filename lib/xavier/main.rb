module Xavier


  class Main < Gosu::Window

    def initialize
      super 800,800, false
      self.caption = 'Xavier - Chess Master'
      @squares = []
      build_board
    end

    # Display cursor
    def needs_cursor?
      true
    end

    def build_board
      (1..8).each do |row|
        (1..8).each do |file|
          @squares << Square.new(self, row, file)
        end
      end

      @squares.last.peace = Peace.new(self,:black,:queen)
    end

    def update
    end

    def draw
      @squares.each{|s| s.draw }
    end

  end
end
