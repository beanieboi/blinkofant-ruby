require 'fcntl'

module Blinkofant
  class Device
    SPI_IOC_WR_MAX_SPEED_HZ = 0x40046b04

    def initialize
      @device = '/dev/spidev0.0'
    end

    def flush(screen)
      @fd = IO::sysopen(@device, Fcntl::O_WRONLY)
      f = IO.open(@fd)
      f.sync = true
      f.ioctl(SPI_IOC_WR_MAX_SPEED_HZ, [100_000].pack("L"))
      f.write(screen.bit_stream.pack("C*"))
      f.close
    end
  end
end
