=begin
A squad of robotic rovers are to be landed by NASA on a plateau on Mars. This
plateau, which is curiously rectangular, must be navigated by the rovers so that
their on-board cameras can get a complete view of the surrounding terrain to
send back to Earth.

A rover's position and location is represented by a combination of x and y co-
ordinates and a letter representing one of the four cardinal compass points. The
plateau is divided up into a grid to simplify navigation. An example position
might be 0, 0, N, which means the rover is in the bottom left corner and facing
North.

In order to control a rover, NASA sends a simple string of letters. The possible
letters are 'L', 'R' and 'M'. 'L' and 'R' makes the rover spin 90 degrees left
or right respectively, without moving from its current spot. 'M' means move
forward one grid point, and maintain the same heading.

Assume that the square directly North from (x, y) is (x, y+1).


INPUT: The first line of input is the upper-right coordinates of the plateau,
the lower-left coordinates are assumed to be 0,0.
 
The rest of the input is information pertaining to the rovers that have been
deployed. Each rover has two lines of input. The first line gives the rover's
position, and the second line is a series of instructions telling the rover how
to explore the plateau.
 
The position is made up of two integers and a letter separated by spaces,
corresponding to the x and y co-ordinates and the rover's orientation.
 
Each rover will be finished sequentially, which means that the second rover
won't start to move until the first one has finished moving.
 
 
OUTPUT The output for each rover should be its final co-ordinates and heading.
 
INPUT AND OUTPUT
 
Test Input: 
5 5 

1 2 N 
LMLMLMLMM 

3 3 E 
MMRMMRMRRM
 
Expected Output: 
1 3 N 
5 1 E
=end

class RoverMap
	attr_accessor :maxX, :maxY

	def initialize(maxX, maxY)
		@maxX = maxX
		@maxY = maxY
	end
end

class Rover
	attr_accessor :roverMap, :xPos, :yPos, :bearing

	def initialize(roverMap, xPos, yPos, bearing)
		@roverMap = roverMap
		@xPos = xPos
		@yPos = yPos
		@bearing = bearing
	end

	def doAction(commands)
		commands.split(//).each do |command|
			self.processAction(command)
		end
	end

	def processAction(command)
		if command=="L" 
			case @bearing
			when "N" then @bearing = "W"
			when "E" then @bearing = "N"
			when "S" then @bearing = "E"
			when "W" then @bearing = "S"
			end
		elsif command=="R"
			case @bearing
			when "N" then @bearing = "E"
			when "E" then @bearing = "S"
			when "S" then @bearing = "W"
			when "W" then @bearing = "N"
			end
		else
			case @bearing
			when "N" then @yPos = @yPos == @roverMap.maxY ? maxY : @yPos + 1  
			when "E" then @xPos = @xPos == @roverMap.maxX ? maxX : @xPos + 1
			when "S" then @yPos = @yPos == 0 ? 0 : @yPos - 1
			when "W" then @xPos = @xPos == 0 ? 0 : @xPos - 1
			end
		end
	end

	#teleport(x,y,bearing)
	def showPosition
		case @bearing
		when "N" then bearingStr = "North"
		when "E" then bearingStr = "East"
		when "S" then bearingStr = "South"
		when "W" then bearingStr = "West"
		end

		puts "Rover is at (#{xPos}, #{yPos}), with bearing: " + bearingStr
	end

	def teleport(x, y, bearing)
		@xPos = x
		@yPos = y
		@bearing = bearing
	end
end

roverMap = RoverMap.new(5,5)
rover1 = Rover.new(roverMap, 1,2, "N")

rover1.doAction("LMLMLMLMM")
rover1.showPosition

rover1.teleport(3,3,"E")
rover1.doAction("MMRMMRMRRM")
rover1.showPosition





