def intcode(noun,verb)
	txt =  File.open("input.txt", "r")
	data = txt.read.split(",")
	data[1] = noun
	data[2] = verb
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
	return data[0]
end


noun = 0
verb = 0
while noun <= 100 do
	verb = 0
	while verb <= 100 do
		result = intcode(noun,verb)
		if result == 19690720
			puts "Resultat : noun = " + noun.to_s + " verb = " + verb.to_s + "\n chiffre a donner : " + (100 * noun + verb).to_s
		end
		verb = verb + 1
	end
	noun = noun + 1
end