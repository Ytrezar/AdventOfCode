def checkFullContains(a,b)
	if (a - b).empty? or (b - a).empty?
		true
	else
		false
	end
end

def checkIntersection(a,b)
	if a.intersection(b).length != 0
		true
	else
		false
	end
end

def d4()
	txt =  File.open("2022/Day4/input.txt", "r")
	data = txt.read.split("\n")
	countp1 = 0
	countp2 = 0
	data.each do |pairs|
		sections = []
		pairs.split(',').each do |assignement|
			sections.append(assignement.split('-'))
		end
		a = (sections[0][0]..sections[0][1]).to_a
		b = (sections[1][0]..sections[1][1]).to_a
		if checkFullContains(a,b)
			countp1 = countp1 +1
		end
		if checkIntersection(a,b)
			countp2 = countp2 +1
		end
	end
	p countp1
	p countp2
end

d4()