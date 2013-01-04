require_relative 'screen'
require_relative 'device'

screen = Blinkofant::Screen.new
device = Blinkofant::Device.new(screen)

s.row(1, true)
d.flush

while true do
  s.shift_rows
  d.flush
  sleep(1)
end
