txt =  File.open("2020/Day3/input.txt", "r")
data = txt.read
map = data.split("\n")
taille = map[0].length
positionx1 = positionx3 = positionx5 = positionx7 = positionx12 = 0
positiony = 0
trees1 = trees3 = trees5 = trees7 = trees12 = 0
map.each do |ligne|
	if positiony != 0
		positionx1 + 1 >= taille ? positionx1 = positionx1 + 1 - taille : positionx1 += 1
		positionx3 + 3 >= taille ? positionx3 = positionx3 + 3 - taille : positionx3 += 3
		positionx5 + 5 >= taille ? positionx5 = positionx5 + 5 - taille : positionx5 += 5
		positionx7 + 7 >= taille ? positionx7 = positionx7 + 7 - taille : positionx7 += 7
		if positiony % 2 == 0
			positionx12 + 1 >= taille ? positionx12 = positionx12 + 1 - taille : positionx12 += 1
		end
	end
	if ligne[positionx1] == "#"
		trees1 += 1
	end
	if ligne[positionx3] == "#"
		trees3 += 1
	end
	if ligne[positionx5] == "#"
		trees5 += 1
	end
	if ligne[positionx7] == "#"
		trees7 += 1
	end
	if ligne[positionx12] == "#" and positiony % 2 == 0
		trees12 += 1
	end
	positiony += 1
end


p trees3 #1st part
p trees1 * trees3 * trees5 * trees7 *trees12 #second part