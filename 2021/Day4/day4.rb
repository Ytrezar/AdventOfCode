def makematrice(tab)
	lines = tab.split("\n")
	result = []
	lines2 = []
	lines.each do |line|
		result.append(line.split(" "))
		lines2.append(line.split(" "))
	end
	i = 0
	while i < result[0].length
		colonne = []
		lines2.each do |line|
			colonne.append(line[i])
		end
		result.append(colonne)
		i += 1
	end
	result
end

def checkwinner(bingo)
	result = 0
	bingo.each do |board|
		if board.include?([])
			board.shift(5).map {|line| line.map {|number| result += number.to_i}}
		end
	end
	result
end

def d4p1()
	txt =  File.open("2021/Day4/input.txt", "r")
	data = txt.read.split("\n\n")
	numbers = data.shift.split(',')
	bingo = []
	data.each do |board|
		bingo.append(makematrice(board))
	end
	numbers.each do |number|
		bingo.each do |board|
			board.each do |line|
				line.delete(number)
			end
		end
		result =  checkwinner(bingo) * number.to_i
		if result != 0
			return result
		end
	end
end

def d4p2
	txt =  File.open("2021/Day4/input.txt", "r")
	data = txt.read.split("\n\n")
	numbers = data.shift.split(',')
	bingo = []
	last = 0
	data.each do |board|
		bingo.append(makematrice(board))
	end
	numbers.each do |number|
		bingo.each do |board|
			board.each do |line|
				line.delete(number)
			end
		end
		if checkwinner(bingo) != 0
			last = checkwinner(bingo) * number.to_i
		end
		bingo.delete_if{|a| a.include?([])}
		if bingo.length == 1
			p bingo
		end
		bingo.delete_if{|a| a.include?([])}
	end
	return last
end
p d4p1()
p d4p2()