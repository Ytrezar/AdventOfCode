def getfirstunique(data, nbfirst)
    i = 0
    while (i < data.length())
        j = i
        #Create array with the last nbfirst elements to compare
        test = []
        while j > i - nbfirst
            test.append(data[j])
            j = j - 1
        end

        #check if the test array contains duplicates
        if i > (nbfirst - 2) and test.uniq.length == nbfirst
            return i + 1
        end
        i = i + 1
    end 
end

def d6()
	txt =  File.open("2022/Day6/input.txt", "r")
    data = txt.read.split('')
    p getfirstunique(data, 4)
    p getfirstunique(data, 14)
end

d6()