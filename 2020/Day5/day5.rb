txt =  File.open("Day5/input.txt", "r")
data = txt.read
list = data.split("\n")
ids = []
maxID = 0
#Check all boarding passes and calculate the seat ID
list.each do |pass|
	i = 0
	maxrow = 127
	minrow = 0
	while i <= 6
		pass[i] == "F" ? maxrow = maxrow - ((maxrow - minrow + 1) / 2).to_i : minrow = (minrow + ((maxrow - minrow + 1) / 2).to_i)
		i+=1
	end
	row = [minrow, maxrow].min
	maxrow = 7
	minrow = 0
	i = 7
	while i <= 9
		pass[i] == "L" ? maxrow = (maxrow - ((maxrow - minrow + 1) / 2).to_i)  : minrow = (minrow + ((maxrow - minrow + 1) / 2).to_i)
		i+=1
	end
	line = [minrow, maxrow].max
	ids.append(row * 8 + line)
	if maxID < row * 8 + line
		maxID = row * 8 + line
	end
end
i = 0
#get all the possibles choices between the 1st available seat and the last available seat
# The only one missing will be mine
supposedids = []
while i < 128
	j = 0
	while j < 8
		if (i * 8 + j)>= ids.min and (i * 8 + j) <= ids.max
			supposedids.append(i * 8 + j)
		end
		j+=1
	end
	i+=1
end
#Part 1
p maxID
#Part 2
p ids.sort -  supposedids | supposedids - ids.sort