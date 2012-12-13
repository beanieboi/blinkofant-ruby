module Blinkofant
	module Pong
		class Ship
			def initialize(screen)
				@screen = screen
				@x = 5
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
				@screen[@x, @y] = true
			end
		end
	end
end