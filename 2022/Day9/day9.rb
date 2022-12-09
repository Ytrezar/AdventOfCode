class Rope
	attr_accessor :snakeposition, :tailpath
	def initialize(position)
		@snakeposition = position
		@tailpath= [[0,0]]
	end

	def moving(instruction)
		if instruction[0] == 'R'
			moveright(instruction[1].to_i)
		elsif instruction[0] == 'L'
			moveleft(instruction[1].to_i)
		elsif instruction[0] == 'U'
			moveup(instruction[1].to_i)
		else
			movedown(instruction[1].to_i)
		end
	end

	def moveup(repetition)
		while repetition > 0
			self.snakeposition[0][0] += 1
			movetail
			repetition -= 1
		end
	end
	def movedown(repetition)
		while repetition > 0
			self.snakeposition[0][0] -= 1
			movetail
			repetition -= 1
		end
	end
	def moveright(repetition)
		while repetition > 0
			self.snakeposition[0][1] += 1
			movetail
			repetition -= 1
		end
	end
	def moveleft(repetition)
		while repetition > 0
			self.snakeposition[0][1] -= 1
			movetail
			repetition -= 1
		end
	end

	def movetail
		i = 1
		while i <= (self.snakeposition.length - 1)
			#positive = go down // negative = go up
			diffupdown = self.snakeposition[i-1][0] - self.snakeposition[i][0]
			#positive = go left // negative = go right
			diffleftright = self.snakeposition[i-1][1] - self.snakeposition[i][1]

			#if the tail is close enough just do nothing
			if diffupdown.abs <= 1 and diffleftright.abs <= 1
				return
			end

			if diffupdown > 1 and diffleftright > 1 #diagonale move down and left
				self.snakeposition[i] = [self.snakeposition[i - 1][0] - 1, self.snakeposition[i - 1][1] - 1]
			elsif diffupdown < -1 and diffleftright > 1 #diagonale move up and left
				self.snakeposition[i] = [self.snakeposition[i - 1][0] + 1, self.snakeposition[i - 1][1] - 1]
			elsif diffupdown > 1 and diffleftright < -1 #diagonale move down and right
				self.snakeposition[i] = [self.snakeposition[i - 1][0] - 1, self.snakeposition[i - 1][1] + 1]
			elsif diffupdown < -1 and diffleftright < -1 #diagonale move up and right
				self.snakeposition[i] = [self.snakeposition[i - 1][0] + 1, self.snakeposition[i - 1][1] + 1]

			elsif diffupdown > 1 #in line move down
				self.snakeposition[i] = [self.snakeposition[i - 1][0] - 1, self.snakeposition[i - 1][1]]
			elsif diffupdown < -1 #in line move up
				self.snakeposition[i] = [self.snakeposition[i - 1][0] + 1, self.snakeposition[i - 1][1]]
			elsif diffleftright > 1 #in line move left
				self.snakeposition[i] = [self.snakeposition[i - 1][0], self.snakeposition[i - 1][1] - 1]
			else #in line move right
				self.snakeposition[i] = [self.snakeposition[i - 1][0], self.snakeposition[i - 1][1] + 1]
			end
			if i == self.snakeposition.length - 1
				self.tailpath.append self.snakeposition[i]
			end
			i += 1
		end
	end

end
def d9
	txt =  File.open("2022/Day9/input.txt", "r")
	data = txt.read.split("\n")
	p1 =[[0,0],[0,0]]
	p2 = [[0,0],[0,0],[0,0],[0,0],[0,0],[0,0],[0,0],[0,0],[0,0],[0,0]]
	rope1 = Rope.new(p1)
	rope2 = Rope.new(p2)
	data.each do |line|
		rope1.moving(line.split(' '))
		rope2.moving(line.split(' '))
	end
	p rope1.tailpath.uniq.length
	p rope2.tailpath.uniq.length
end

d9

