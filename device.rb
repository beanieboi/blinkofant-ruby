require 'fcntl'

module Blinkofant
  class Device

    def initialize
      @device = '/dev/spidev0.0'
      @fd = IO::sysopen(@device, Fcntl::O_WRONLY)
    end

    def flush
      f = IO.open(fd)
      f.ioctl(4, 100000)
      f.syswrite("TEMP DATA")
      f.close
    end
  end
end
