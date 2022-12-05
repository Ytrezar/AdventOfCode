def d3p1()
	txt =  File.open("2021/Day3/input.txt", "r")
	data = txt.read.split("\n")
	i = 0
	gamma = ""
	epsilon = ""
	cpt = 0
	while i < data[0].split('').length
		data.each do |line|
			cpt += line[i].to_i
		end
		#si le compteur est plus haut que la moitié de la taille du fichier
		#alors il y a plus de 1 que de 0
		if cpt * 2 > data.length
			gamma = gamma + "1"
			epsilon = epsilon + "0"
		else
			gamma = gamma + "0"
			epsilon = epsilon + "1"
		end
		i += 1
		cpt = 0
	end
	p gamma.to_i(2) * epsilon.to_i(2)
end




def findarray(myarray,amount, i, startwith)
	cpt = 0
	myarray.each do |line|
		cpt += line[i].to_i
	end
	len =  myarray.length.to_i
	if amount == "higher" and cpt * 2 >= len
		startwith = startwith + "1"
	elsif amount == "lower" and cpt * 2 < len
		startwith = startwith + "1"
	else
		startwith = startwith + "0"
	end
	if myarray.select{|a| a.start_with?(startwith)}.length == 1
		myarray.select{|a| a.start_with?(startwith)}[0]
	else
		findarray(myarray.select{|a| a.start_with?(startwith)},amount, i+1, startwith)
	end
end

def d3p2()
	txt =  File.open("2021/Day3/input.txt", "r")
	datao2 = txt.read.split("\n")
	p findarray(datao2,"higher",0,"").to_i(2) * findarray(datao2,"lower",0,"").to_i(2)
end

d3p1()
d3p2()