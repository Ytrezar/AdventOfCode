def d2p1p2()

	txt =  File.open("2023/Day2/input.txt", "r")
	data = txt.read.split("\n")
	result = 0
	result2 = 0
	data.each do |line|
		splitted = line.split(':')
		lineId =  splitted[0].split(' ')[1].to_i
		games = splitted[1].split(';')
		possible = true
		minblue = 0
		minred = 0
		mingreen = 0
		games.each do |game|

			cubes = game.split(',')
			cubes.each do |cube|
				blue = 0
				red = 0
				green = 0
				coloredCube = cube.split(' ')
				if coloredCube[1] == 'blue'
					blue = coloredCube[0].to_i
				elsif coloredCube[1] == 'red'
					red = coloredCube[0].to_i
				elsif coloredCube[1] == 'green'
					green = coloredCube[0].to_i
				end
				if minred < red
					minred = red
				end
				if minblue < blue
					minblue = blue
				end
				if mingreen < green
					mingreen = green
				end
				unless checkPossiblity(blue, green, red)
					possible = false
				end
			end
		end
		result2 = result2 + (mingreen * minred * minblue)
		if possible
			result = result + lineId
		end
	end
	p result
	p result2
end

def checkPossiblity(blue,green,red)
	if red > 12 or green > 13 or blue > 14
		false
	else
		true
	end
end

d2p1p2