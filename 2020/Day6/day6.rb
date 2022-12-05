txt =  File.open("2020/Day6/input.txt", "r")
data = txt.read
list = data.split("\n\n")
count = 0
count2 = 0
list.each do |groupe|
	question = []
	question2 = []
	i = 0
	ligne = groupe.split("\n")
	ligne.each do |a|
		individual = []
		a.split("").each do |b|
			individual.append(b)
			#P1 Check if the character already exist in the array
			unless question.include?(b)
				question.append(b)
			end
		end
		#P2 If is the first line of the group don't ask question
		if i == 0
			question2 = individual
			#P2 If it's not the first, get the elements that are in both arrays as a reference
		else
			question2 = question2 & individual
		end
		i += 1
	end
	count += question.length
	count2 += question2.length
end
p count #Part1
p count2 #Part2