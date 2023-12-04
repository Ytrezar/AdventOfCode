def d3p1()
	txt =  File.open("2023/Day3/input.txt", "r")
	data = txt.read.split("\n")
	matrice = []
	data.each do |line|
		matrice << line.split('')
	end
	rows = matrice.length
	cols = matrice[0].length
	result = 0
	validnumbers = []
	(0...rows).each do |i|
		number = ''
		adjacent = false
		(0...cols).each do |j|
			if is_number?(matrice[i][j])
				number = number + matrice[i][j]
				if isAdjacent(matrice, i, j)
					adjacent = true
				end
				if j == cols# - 1 and adjacent
					result = result + number.to_i
					validnumbers << number.to_i
					number = ''
					adjacent = false
				end
			else
				if number != '' and adjacent
					result = result + number.to_i
					validnumbers << number.to_i
					number = ''
					adjacent = false
				else
					number = ''
				end
			end
		end
	end
	p validnumbers
	p result
end

def d3p2()
	txt =  File.open("2023/Day3/input.txt", "r")
	data = txt.read.split("\n")
	matrice = []
	data.each do |line|
		matrice << line.split('')
	end
	rows = matrice.length
	cols = matrice[0].length
	result = 0
	(0...rows).each do |i|
		(0...cols).each do |j|
			if matrice[i][j] == '*'
				numbers = nbAdjacent(matrice, i,j)
				if numbers.length == 2
					result = result + (numbers[0].to_i * numbers[1].to_i)
				end
			end
		end
	end
	p result
end



def isAdjacent(matrice, i, j)
	rows = matrice.length
	cols = matrice[0].length
	offsets = [
		[-1, -1], [-1, 0], [-1, 1],
		[0, -1],           [0, 1],
		[1, -1],  [1, 0],  [1, 1]
	]
	offsets.each do |offset_i, offset_j|
		new_i, new_j = i + offset_i, j + offset_j

		# Check if the new coordinates are within the matrix boundaries
		if (0...rows).cover?(new_i) && (0...cols).cover?(new_j)
			if not is_number?(matrice[new_i][new_j]) and matrice[new_i][new_j] != '.'
				return true
			end
		end
	end
	return false
end

def nbAdjacent(matrice, i, j)
	rows = matrice.length
	cols = matrice[0].length
	numbers = []
	offsets = [
		[-1, -1], [-1, 0], [-1, 1],
		[0, -1],           [0, 1],
		[1, -1],  [1, 0],  [1, 1]
	]
	offsets.each do |offset_i, offset_j|
		new_i, new_j = i + offset_i, j + offset_j
		if (0...rows).cover?(new_i) && (0...cols).cover?(new_j)
			if is_number?(matrice[new_i][new_j])
				number = getFullNumber(matrice, new_i, new_j)
				unless numbers.include?(number)
					numbers << number
				end
			end
		end
	end
	return numbers
end

def is_number?(char)
	Integer(char) rescue false
end

def getFullNumber(matrice, i, j)
	number = ''
	cols = matrice[0].length - 1
	while j >= 0 and is_number?(matrice[i][j])
		j = j -1
	end

	while j <= cols and is_number?(matrice[i][j+1])
		number = number + matrice[i][j+1]
		j = j + 1
	end
	return number
end
def mytest()
	txt =  File.open("2023/Day3/input.txt", "r")
	data = txt.read.split("\n")
	matrice = []
	data.each do |line|
		matrice << line.split('')
	end
	p isAdjacent(matrice,11,137)
end
#mytest()
#d3p1()
d3p2()