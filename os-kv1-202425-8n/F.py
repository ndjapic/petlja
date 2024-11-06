n = int(input())
promene = [int(deo) for deo in input().split()]

d = dict()
sjaj = c = odg = 0

for i in range(n):
    d[sjaj] = c+1
    sjaj += promene[i]
    c = d.get(sjaj, 0)
    odg += c

print(odg)
