require './screen'
require './device'
require './pong/ship'

module Blinkofant
	module Pong
		class Game
			def initialize
				@screen = Screen.new
				@device = Device.new
				@ship1 = Ship.new(@screen)

				main_loop
			end

			def main_loop
				while true do
					sleep(0.5)
					@screen.blank

					@ship1.left
					@ship1.draw
					
					@device.flush(@screen)
				end
			end
		end
	end
end


g = Blinkofant::Pong::Game.new