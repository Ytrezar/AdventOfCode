def d12
	txt =  File.open("2022/Day12/input.txt", "r")
	grid = []
	data = txt.read.split("\n")
	data.each do |line|
		grid.append(line.split(''))
	end
	maxi = grid.length
	maxj = grid[0].length
	startpoint = []
	j = 0
	while j < maxj
		i = 0
		while i < maxi
			if grid[i][j] == 'S'
				startpoint = [i,j]
			elsif grid[i][j] == 'E'
				endpoint = [i,j]
			end
			i += 1
		end
		j += 1
	end
	p startpoint
	p endpoint
end
d12