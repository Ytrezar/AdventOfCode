
def getanomalie(sac)
	compartiments = sac.split('').each_slice(sac.length / 2).map(&:join)
	compartiments[0].split('').intersection(compartiments[1].split(''))
end

def getanomaliep2(sac)
	sac[0].intersection(sac[1],sac[2])
end

def priorities(letter)
	letters = ("a".."z").to_a + ("A".."Z").to_a
	letters.index(letter) + 1
end

def d3p1()
	values = 0
	txt =  File.open("2022/Day3/input.txt", "r")
	data = txt.read.split("\n")
	data.each do |sac|
		values = values + priorities(getanomalie(sac)[0])
	end
	p values
end

def d3p2()
	values = 0
	txt =  File.open("2022/Day3/input.txt", "r")
	data = txt.read.split("\n")
	i = 0
	groupe =[]
	data.each do |sac|
		if i < 2
			groupe.append(sac.split(''))
			i = i + 1
		else
			groupe.append(sac.split(''))
			values = values + priorities(getanomaliep2(groupe)[0])
			groupe = []
			i = 0
		end
	end
	p values
end

d3p1()
d3p2()
