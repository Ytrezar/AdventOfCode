def buildfilesystem(data)
	# build the file system based on the data we're receiving
	position = []
	filesystem ={}
	data.each do |line|
		#if we change directory
		if line.start_with?('$ cd')
			#we check if we're going back to the previous one
			if line.split(' ')[2] == '..'
				position.pop
			else
				position.append(line.split(' ')[2])
				key = stringify(position)
				#adding the directory to the filesystem
				unless filesystem.has_key? key
					filesystem = addnewfolder(filesystem, key)
				end
			end
		elsif !line.start_with? '$'
			# if it's not an instruction it means it's a file with a size to add
			key = stringify(position)
			filesystem[key] = filesystem[key] + line.split(' ')[0].to_i
		end
	end
	truefoldersize(filesystem)
end

def getmaxsize(filesystem)
	# return the max size of the tree
	max = 0
	filesystem.each do |folder|
		test = folder[0].split('.')
		if test.length > max
			max = test.length
		end
	end
	max
end

def stringify(anarray)
	# due to the fact that hashes are bound to an adress, we need to use
	# a string to store keys.
	str = ''
	anarray.each do |directory|
		str = str  + directory + '.'

	end
	# removing the last "." to prevent errors in the split later
	str.chop
end

def truefoldersize(filesystem)
	# go through the file system and add to the parent folder
	# the size of the childrens
	treesize =  getmaxsize(filesystem)
	# if we reach the root folder, don't go further
	while treesize > 1
		a = filesystem
		a.each do |folder|
			test = folder[0].split('.')
			#we start at the leafs and go up the tree
			if test.length == treesize
				test.pop
				filesystem[stringify(test)] = filesystem[stringify(test)] + folder[1]
			end
		end
		treesize = treesize - 1
	end
	filesystem
end

def addnewfolder(filesystem, position)
	# Add a new folder to the system and initialize
	# the size at 0 for now
	filesystem[position] = 0
	filesystem
end

def displayresults(filesystem)
	p1 = 0
	p2 = filesystem['/']
	# determine the space left in the system
	empty = 70000000 - filesystem['/']

	filesystem.each do |directory|
		# get all directory under the size of 100 000
		if directory[1] < 100000
			p1 = p1 + directory[1]
		end
		# get the smallest directory to delete to have 30 000 000 empty space
		if empty + directory[1] > 30000000
			if p2 > directory[1]
				p2 = directory[1]
			end
		end
	end
	p p1
	p p2
end

def d7
	txt =  File.open("2022/Day7/input.txt", "r")
	data = txt.read.split("\n")
	filesystem = buildfilesystem(data)
	displayresults(filesystem)
end

d7