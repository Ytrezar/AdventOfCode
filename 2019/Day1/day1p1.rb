txt =  File.open("input.txt", "r")
data = txt.read
sum = 0
data.split("\n").each do |line|
	sum = sum + ((line.to_i / 3 ) -2)
end
puts sum