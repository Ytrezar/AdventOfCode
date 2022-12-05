txt =  File.open("input.txt", "r")
data = txt.read.split(",")
i = 0

while data[i].to_i != 99
	instruction = data[i].to_s.split("")

	while instruction.length < 5
		instruction.unshift(0)
	end
	opcode = (instruction[3].to_s + instruction[4].to_s).to_i
	if instruction[2].to_i == 0
		op1 = data[i+1].to_i
	else
		op1 = i+1
	end
	if instruction[1].to_i == 0
		op2 = data[i+2].to_i
	else
		op2 = i+2
	end
	if instruction[0].to_i == 0
		result = data[i+3].to_i
	else
		result = i+3
	end


	if opcode == 1
		a = data[op1].to_i + data[op2].to_i
		data[result] = a
		i+=4
	elsif opcode == 2
		a = data[op1].to_i * data[op2].to_i
		data[result] = a
		i+=4
	elsif opcode == 3
		puts "gib me 1 pls"
		gib = gets.chomp
		data[data[i+1].to_i] = gib
		i+=2
	elsif opcode == 4
		puts data[op1]
		i+=2
	else
		puts "Erreur"
		break
	end
end