module Blinkofant
	module Pong
		class Ship
			def initialize(screen)
				@screen = screen
				@x = 0
				@y = 0
			end

			def left
				if @x < @screen.max_x 
					@x = @x + 1
				end
			end

			def right
				if @x > 0
					@x = @x - 1
				end
			end

			def draw
				@screen[@y, @x] = true
			end
		end
	end
end