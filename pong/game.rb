module Blinkofant
	module Pong
		class Game
			def initialize
				@screen = Screen.new
				@device = Device.new
				@ship1 = Ship.new(@screen)

				loop
			end

			def loop
				sleep(1)
				while true do
					@screen.blank

					@ship1.left
					@ship1.draw
					
					@device.flush(@screen)
				end
				
			end
		end
	end
end