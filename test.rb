require './screen'
require './device'

d = Blinkofant::Device.new
s = Blinkofant::Screen.new

s.row(1, true)
d.flush(s)

while true do
  s.shift_rows
  d.flush(s)
  sleep(1)
end