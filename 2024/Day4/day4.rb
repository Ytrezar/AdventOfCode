def d4
	txt =  File.open("2024/Day4/input.txt", "r")
	data = txt.read.split("\n")
	process(data)
end

def process(data)
	result = 0
	resultp2 = 0
	(0..data.size-1).each do |i|
		(0..data[0].size-1).each do |j|
			if data[i][j] == "X"
				result += findXMAS(data,i,j)
			end
			if data[i][j] == "A"
				resultp2 += findMAS(data,i,j)
			end
		end
	end
	p result
	p resultp2
end

def findXMAS(data, i, j)
	word = "XMAS"
	result = 0
	directions = [
		[0, 1],   # Right
		[1, 0],   # Down
		[0, -1],  # Left
		[-1, 0],  # Up
		[1, 1],   # Down-Right
		[1, -1],  # Down-Left
		[-1, -1], # Up-Left
		[-1, 1]   # Up-Right
	]
	directions.each do |vert, hor|
		matched = true
		# We know that the X is already there, so we start from 1
		# and we go further into the direction until we reach the end of the word
		(1..word.length-1).each do |x|
			mi = i + vert * x
			mj = j + hor * x
			# We check if the next step will still be in the bounds of the text
			if mj < 0 || mi < 0 || mj >= data[j].size || mi >= data.size || data[mi][mj] != word[x]
				matched = false
				break
			end
		end
		if matched
			result +=1
		end
	end
	result
end
def findMAS(data, i, j)
	# We are in the middle of the cross by finding the A
	# All we need is to get both diagonals check if they are both MAS in any ways
	if i > 0 && i < data.size - 1 && j > 0 and j < data[0].size - 1
		diag1 = [data[i+1][j+1], data [i][j] ,data[i-1][j-1]]
		diag2 = [data[i+1][j-1], data [i][j] ,data[i-1][j+1]]
		if diag1.sort == diag2.sort && diag1.sort == ["A", "M", "S"]
			return 1
		else
			return 0
		end
	else
		return 0
	end

end

d4