def d4
	txt =  File.open("2025/Day4/input.txt", "r")
	lines = txt.read.split("\n")
	processlines(lines)
end
def processlines(lines)
	tab = getTab(lines)
	result = getResultP1(tab)
	resultp2 = getResultP2(tab)
	p result
	p resultp2
end

def getTab(lines)
	tab = []
	lines.each do |line|
		tab.append(line.split(""))
	end
	tab
end
def getResultP1(tab)
	result = 0
	(0..tab.length-1).each do |i|
		(0...tab[0].length).each do |j|
			if tab[i][j] == "@"
				if isAccessible(tab, i, j)
					result+= 1
				end
			end
		end
	end
	result
end

def getResultP2(tab)
	result = 0
	result1turn = -1
	# Loop until no more @ are accessible
	while result1turn != 0
		result1turn = 0
		(0..tab.length-1).each do |i|
			(0...tab[0].length).each do |j|
				if tab[i][j] == "@"
					if isAccessible(tab, i, j)
						result1turn += 1
						# Remove the @ that we just used
						tab[i][j] = "."
					end
				end
			end
		end
		result += result1turn
	end
	result
end
def isAccessible(tab, i, j)
	rows = tab.length
	cols = tab[0].length
	count = 0

	# Store all 8 directions for neighbours
	directions = [
		[-1, -1], [-1, 0], [-1, 1],
		[ 0, -1],          [ 0, 1],
		[ 1, -1], [ 1, 0], [ 1, 1]
	]

	directions.each do |di, dj|
		ni, nj = i + di, j + dj

		# Check if the coordinates are in bounds
		if ni >= 0 && ni < rows && nj >= 0 && nj < cols
			count += 1 if tab[ni][nj] == "@"
		end
	end
	if count < 4
		true
	else
		false
	end
end

d4