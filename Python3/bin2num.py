#!/usr/bin/python3
X = "0110111"
count = len(X)
Z = 0
print(count)
for i in X:
    count -= 1
    Z = Z + (int(i)<<count)
    print(int(Z))


