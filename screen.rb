module Blinkofant
  class Screen
    NINE_BITS =  /........./
    EIGHT_BITS = /......../

    def initialize
      @screen = [[false, false, false, false, false, false, false, false, false],
                 [false, false, false, false, false, false, false, false, false],
                 [false, false, false, false, false, false, false, false, false],
                 [false, false, false, false, false, false, false, false, false],
                 [false, false, false, false, false, false, false, false, false],
                 [false, false, false, false, false, false, false, false, false],
                 [false, false, false, false, false, false, false, false, false],
                 [false, false, false, false, false, false, false, false, false]]

      @blink_bit = "1"
    end

    def col(col, value)
      @screen.each { |row| row[col]= value}
    end

    def row(row, value)
      @screen[row].map! { |p| p = value}
    end

    def []=(row, col, value)
      @screen[row][col] = value
    end

    # convert to bit stream
    def ascii_bit_stream
      @screen.flatten.inject("") { |r, p| r << (p ? "1" : "0") }
    end

    # add blink bit (first bit)
    def ascii_bit_stream_with_blink
      ascii_bit_stream.scan(NINE_BITS).map { |b| (@blink_bit + b) }.join("")
    end

    def bit_stream
      ascii_bit_stream_with_blink.scan(EIGHT_BITS).map { |b| b.to_i(2) }
    end
  end
end