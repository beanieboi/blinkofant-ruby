require 'fcntl'

module Blinkofant
  class Device

    def initialize
      @device = '/dev/spidev0.0'
      @fd = IO::sysopen(@device, Fcntl::O_WRONLY)
    end

    def flush(screen)
      f = IO.open(fd)
      f.ioctl(4, 100000)
      f.syswrite(screen.bit_stream)
      f.close
    end
  end
end
