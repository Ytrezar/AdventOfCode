def d1
	txt =  File.open("2024/Day1/input.txt", "r")
	data = txt.read.split("\n")
	processlines(data)
end

def processlines(data)
	row1 = []
	row2 = []
	result = 0
	resultp2 = 0
	# We separate the two rows in different arrays to process them
	data.each do |line|
		row1.append(line.split('   ')[0].to_i)
		row2.append(line.split('   ')[1].to_i)
	end

	# Sorting the arrays so we can substract the smallest numbers
	row1 = row1.sort
	row2 = row2.sort

	# Adding to result the substraction of each line of the row
	(0..row1.size-1).each do |i|
		result = result + [row1[i], row2[i]].max - [row1[i], row2[i]].min
		# Part 2 multiplying number of the 1st row with the number of occurence in row2
		resultp2 = resultp2 + row1[i] * row2.count(row1[i])
	end
	p result
	p resultp2
end

d1