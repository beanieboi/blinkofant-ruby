require_relative 'screen'
require_relative 'device'

screen = Blinkofant::Screen.new
device = Blinkofant::Device.new(screen)

screen.row(1, true)
device.flush

while true do
  screen.shift_rows
  device.flush
  sleep(1)
end
