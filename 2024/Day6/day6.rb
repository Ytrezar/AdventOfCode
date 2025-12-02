def d6
	txt =  File.open("2024/Day6/input.txt", "r")
	data = txt.read.split("\n")
	tab = []
	#Range le terrain dans un tableau à double entré
	data.each do |line|
		tab << line.split("")
	end
	p getNbCase(tab)
end

def getNbCase(tab)
	# Condition d'arrêt établie au moment où le garde sort de la carte
	inRange = true
	seenPosition = []
	seenPosition << getGuardPosition(tab)
	nbCase = 1

	while inRange
		tab = moveGuard(tab)
		guardPos = getGuardPosition(tab)
		inRange = getInRange(guardPos)
		if inRange and isNewPosition(seenPosition, guardPos)
			seenPosition << guardPos
			nbCase += 1
		end
	end
	nbCase
end

def getGuardPosition(tab)
	#Renvoi les coordonées du garde. Si aucun garde n'est trouvé, renvoie -1,-1)
	tab.each_with_index do |row, i|
		row.each_with_index do |cell, j|
			return [i, j] if ['^', 'v', '>', '<'].include?(cell)
		end
	end
	[-1, -1] # Aucun garde trouvé
end

def moveGuard(tab)
	# Obtenir la position du garde
	guard_pos = getGuardPosition(tab)
	return tab if guard_pos == [-1, -1] # Pas de garde trouvé, on retourne le tableau inchangé

	i, j = guard_pos
	guard = tab[i][j]

	# Définit les directions et leur ordre dans le sens horaire
	directions = ['^', '>', 'v', '<']
	direction_moves = {
		'^' => [-1, 0], # Haut
		'v' => [1, 0],  # Bas
		'>' => [0, 1],  # Droite
		'<' => [0, -1]  # Gauche
	}

	# Calcul de l'étape suivante dans la direction actuelle
	di, dj = direction_moves[guard]
	next_i = i + di
	next_j = j + dj

	# Vérifie si le garde sort du tableau
	if next_i < 0 || next_i >= tab.length || next_j < 0 || next_j >= tab[0].length
		# Le garde sort de la carte, on le fait "disparaître"
		tab[i][j] = '.' # Ancienne position devient '.'
	elsif tab[next_i][next_j] != '#'
		# Le garde se déplace
		tab[i][j] = '.' # Ancienne position devient '.'
		tab[next_i][next_j] = guard # Nouvelle position du garde
	else
		# Tourner le garde dans le sens horaire
		current_direction_index = directions.index(guard)
		new_direction = directions[(current_direction_index + 1) % directions.length]
		tab[i][j] = new_direction # Mise à jour de l'orientation du garde
	end

	tab
end

def getInRange(guardPos)
	if guardPos == [-1, -1]
		false
	else
		true
	end
end

def isNewPosition(seenPosition, guardPos)
	seenPosition.include?(guardPos) ? false : true
end


d6