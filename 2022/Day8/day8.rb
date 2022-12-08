def isvisible(grid,i,j)
	blockup = false
	blockdown = false
	blockleft = false
	blockright = false

	#if in a border return visible
	if i == (grid[0].length - 1) or i == 0 or j == 0 or j == (grid[0].length - 1)
		true
	else

		a = 0
		#run until the end or when we have found all sides blocked
		while a < grid[i].length and !(blockup and blockleft and blockright and blockdown)
			#left
			if (grid[i][a].to_i >= grid[i][j].to_i) and (a < j)
				blockleft = true
			end
			#right
			if (grid[i][a].to_i >= grid[i][j].to_i) and (a > j)
				blockright = true
			end
			#top
			if (grid[a][j].to_i >= grid[i][j].to_i) and (a < i)
				blockup = true
			end
			#bottom
			if (grid[a][j].to_i >= grid[i][j].to_i) and (a > i)
				blockdown = true
			end
			a = a + 1
		end
		if blockup and blockleft and blockright and blockdown
			false
		else
			true
		end
	end
end

def getscenicscore(grid, i,j)
	nbtreeup = 0
	nbtreedown = 0
	nbtreeleft = 0
	nbtreeright = 0

	#left
	a = j - 1
	#We must be sure that if you're on a border, you don't get any points
	if a == 0
		nbtreeleft = 0
	else
		while a >= 0
			if grid[i][a].to_i < grid[i][j].to_i
				nbtreeleft = nbtreeleft + 1
			else
				#Even if it's a stop, the tree must be counted
				nbtreeleft = nbtreeleft + 1
				a = 0
			end
			a = a - 1
		end
	end

	#right
	a = j + 1
	if a == grid[i].length
		nbtreeright = 0
	else
		while a < grid[i].length
			if grid[i][a].to_i < grid[i][j].to_i
				nbtreeright = nbtreeright + 1
			else
				nbtreeright = nbtreeright + 1
				a = grid[i].length
			end
			a = a + 1
		end
	end


	#up
	a = i - 1
	if a == 0
		nbtreeup = 0
	else
		while a >= 0
			if grid[a][j].to_i < grid[i][j].to_i
				nbtreeup = nbtreeup + 1
			else
				nbtreeup = nbtreeup + 1
				a = 0
			end
			a = a - 1
		end
	end

	#down
	a = i + 1
	if a == grid[i].length
		nbtreedown = 0
	else
		while a < grid[i].length
			if grid[a][j].to_i < grid[i][j].to_i
				nbtreedown = nbtreedown + 1
			else
				nbtreedown = nbtreedown + 1
				a = grid[i].length
			end
			a = a + 1
		end
	end

	nbtreeup * nbtreeright * nbtreeleft * nbtreedown
end


def d8
	txt =  File.open("2022/Day8/input.txt", "r")
	data = txt.read.split("\n")
	grid = []
	visibletree = 0
	maxscore = 0
	data.each do |line|
		grid.append(line.split(''))
	end
	i = grid[0].length - 1
	while i >= 0
		j = grid[0].length - 1
		while j >= 0
			if isvisible(grid,i,j)
				visibletree = visibletree  + 1
			end
			score = getscenicscore(grid,i,j)
			if score > maxscore
				maxscore = score
			end
			j = j - 1
		end
		i = i - 1
	end
	p visibletree
	p maxscore
end
d8