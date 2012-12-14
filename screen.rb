module Blinkofant
  class Screen
    NINE_BITS =  /........./
    EIGHT_BITS = /......../

    def initialize
      @screen = [ Array.new(32, false),
                  Array.new(32, false),
                  Array.new(32, false),
                  Array.new(32, false),
                  Array.new(32, false),
                  Array.new(32, false),
                  Array.new(32, false),
                  Array.new(32, false),
                  Array.new(32, false)]

      @blink_bit = "1"
    end

    def col(col, value)
      @screen.each { |row| row[col]= value}
    end

    def row(row, value)
      @screen[row].map! { |p| p = value}
    end

    def shift_cols
      @screen.each { |row| row << row.shift }
    end

    def shift_rows
      @screen << @screen.shift
    end

    def []=(row, col, value)
      puts row
      puts col
      @screen[row][col] = value
    end

    # convert to bit stream
    def ascii_bit_stream
      s = ""
      0.upto(32) do |col|
        @screen.each do |row|
          s << (row[col] ? "1" : "0")
        end
      end
      s
    end

    # add blink bit (first bit)
    def ascii_bit_stream_with_blink
      ascii_bit_stream.scan(EIGHT_BITS).map { |b| (@blink_bit + b) }.join("")
    end

    def bit_stream
      ascii_bit_stream_with_blink.scan(EIGHT_BITS).map { |b| b.to_i(2) }
    end
  end
end