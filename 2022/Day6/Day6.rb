def getfirstunique(data, nbfirst)
    i = 0
    test = []
    while (i < data.length())
        #Create array with the last nbfirst elements to compare
        if (test.length == nbfirst)
            test.shift
            test.append(data[i])
        else
            test.append(data[i])
        end
        #check if the test array contains duplicates
        if i > (nbfirst - 2) and test.uniq.length == nbfirst
            return i + 1
        end
        i = i + 1
    end 
end

def d6()
	txt =  File.open("input.txt", "r")
    data = txt.read.split('')
    p getfirstunique(data, 4)
    p getfirstunique(data, 14)
end

d6()