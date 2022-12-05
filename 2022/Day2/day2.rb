def getScore(match)
	board = {"A X" => 4, "A Y" => 8, "A Z" => 3, "B X" => 1, "B Y" => 5, "B Z" => 9, "C X" => 7, "C Y" => 2, "C Z" => 6}
	board[match]
end

def getScoreP2(match)
	board = {"A X" => 3, "A Y" => 4, "A Z" => 8, "B X" => 1, "B Y" => 5, "B Z" => 9, "C X" => 2, "C Y" => 6, "C Z" => 7}
	board[match]
end

def d2()
	txt =  File.open("2022/Day2/input.txt", "r")
	data = txt.read.split("\n")
	scorep1 = 0
	scorep2 = 0

	data.each do |match|
		scorep1 = scorep1 + getScore(match)
		scorep2 = scorep2 + getScoreP2(match)
	end
	p scorep1
	p scorep2
end

d2()