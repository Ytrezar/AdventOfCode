txt =  File.open("2020/Day1/input.txt", "r")
data = txt.read
numb = []
data.split("\n").each do |line|
	numb.append(line.to_i)
end
resultat = 0
resultat2 = 0
numb.each do |num1|
	numb.each do |num2|
		if num1 + num2 == 2020
			resultat = num1 * num2
		end
		numb.each do |num3|
			if num1 + num2 + num3 == 2020
				resultat2 = num1 * num2 * num3
			end
		end
	end
end
p resultat
p resultat2