def d4p1p2()
	txt =  File.open("2023/Day4/input.txt", "r")
	data = txt.read.split("\n")
	result = 0
	nbCards = Hash.new { |hash, key| hash[key] = 0}
	data.each do |line|
		deck = line.split(':')[1].split('|')[0].split(' ')
		winning = line.split(':')[1].split('|')[1].split(' ')
		# Intersection of both arrays to get the number of winning numbers
		nbWin = (deck & winning).length
		if nbWin > 0
			result = result + 2 ** ((deck & winning).length - 1)
		end

		#Beginning of part 2
		lineNumber = line.split(':')[0].split(' ')[1].to_i
		nbCards[lineNumber] = nbCards[lineNumber] + 1
		if nbWin > 0
			(0...nbCards[lineNumber]).each do
				(1...nbWin+1).each do |j|
					nbCards[lineNumber + j] = nbCards[lineNumber + j] + 1
				end
			end
		end
	end
	p result
	p nbCards.values.sum
end

d4p1p2()