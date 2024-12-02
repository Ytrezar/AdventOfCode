def d1
	txt =  File.open("2024/Day1/input.txt", "r")
	data = txt.read.split("\n")
	processlines(data)
end

def processlines(data)
	column1 = []
	column2 = []
	result = 0
	resultp2 = 0
	# We separate the two columns in different arrays to process them
	data.each do |line|
		column1.append(line.split('   ')[0].to_i)
		column2.append(line.split('   ')[1].to_i)
	end

	# Sorting the arrays so we can substract the smallest numbers
	column1 = column1.sort
	column2 = column2.sort

	# Adding to result the substraction of each line of the column
	(0..column1.size-1).each do |i|
		result = result + [column1[i], column2[i]].max - [column1[i], column2[i]].min
		# Part 2 multiplying number of the 1st column with the number of occurence in column2
		resultp2 = resultp2 + column1[i] * column2.count(column1[i])
	end
	p result
	p resultp2
end

d1