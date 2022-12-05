def getvalues(rawvalues)
	temp = rawvalues.split(" ")
	start = temp[3].to_i-1
	ending = temp[5].to_i-1
	moves = temp[1].to_i
	[moves,ending,start]
end

def display(pile)
	p pile[0].pop + pile[1].pop+pile[2].pop+pile[3].pop+pile[4].pop+pile[5].pop+pile[6].pop+pile[7].pop+pile[8].pop
end

def getpile()
	[['B','M','D','T','W','C','F','M'],
    ['N','B','L'],
    ['J','C','H','T','L', 'V'],
    ['S','P','J','W'],
    ['Z','S','C','F','T','L','R'],
    ['W','D','G','B','H','N','Z'],
    ['F','M','S','P','V','G','C','N'],
    ['W','Q','R','J','F','V','C','Z'],
    ['R','P','M','L','H']]
end

def d5p1()
	txt =  File.open("2022/Day5/input.txt", "r")
	data = txt.read.split("\n\n")[1]
	pile = getpile()
	list = data.split("\n")
	list.each do |rawinstruction|
		instruction = getvalues(rawinstruction)
		while instruction[0] > 0
			pile[instruction[1]].append(pile[instruction[2]].pop)
			instruction[0] = instruction[0] - 1
		end
	end
	display(pile)
end
def d5p2()
	txt =  File.open("2022/Day5/input.txt", "r")
	data = txt.read.split("\n\n")[1]
	pile = getpile()
	list = data.split("\n")
	list.each do |rawinstruction|
		instruction = getvalues(rawinstruction)
		if instruction[0] == 1
			pile[instruction[1]].append(pile[instruction[2]].pop)
		else
			pile[instruction[1]] = pile[instruction[1]] + pile[instruction[2]].pop(instruction[0])
		end
	end
	display(pile)

end

d5p1()
d5p2()
