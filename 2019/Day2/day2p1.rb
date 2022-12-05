txt =  File.open("input.txt", "r")
data = txt.read.split(",")
data[1] = 12
data[2] = 2
i = 0
while data[i].to_i != 99
	if data[i].to_i == 1
		a = data[data[i+1].to_i].to_i + data[data[i+2].to_i].to_i
		data[data[i+3].to_i] = a
	elsif data[i].to_i == 2
		a = data[data[i+1].to_i].to_i * data[data[i+2].to_i].to_i
		data[data[i+3].to_i] = a
	else
		puts "Erreur"
	end
	i+=4
end
puts data[0]