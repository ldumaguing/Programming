tile = 1
From="e"

dont = 2
if From=="n": dont = 8
if From=="e": dont = 4
if From=="w": dont = 1

should = tile | dont
print("should:", should)
for i in range(16):
	doors = (i | should)^should 
	print(i, doors, doors<<4, doors | (doors<<4))


