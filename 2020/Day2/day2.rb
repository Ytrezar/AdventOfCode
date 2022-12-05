txt =  File.open("2020/Day2/input.txt", "r")
data = txt.read
good = 0
good2 = 0
data.split("\n").each do |line|
	pass = line.split(" ")
	min = pass[0].split("-")[0].to_i
	max = pass[0].split("-")[1].to_i
	check = pass[1][0]
	if pass[2].count(check) >= min and pass[2].count(check) <= max
		good += 1
	end
	if (pass[2][min-1] == check and pass[2][max-1] != check) or (pass[2][min-1] != check and pass[2][max-1] == check)
		good2 += 1
	end
end
p good
p good2