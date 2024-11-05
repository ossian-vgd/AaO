print("hello world")
print("hello shane")

totalLeadership = 50000;

# the lookup is strength, health, leadership
statLookup = {
    'MELEE-G-9' : (5510,16530,1),
    'MELEE-G-8' : (3060,9180,1)
}

countLookup = {
    'MELEE-S-8' : 440,
    'MOUNT-S-8' : 215,
    'RANGE-S-8' : 420,
    'FLY-S-8' : 20,
    
    'MELEE-S-9' : 226,
    'MOUNT-S-9' : 112,
    'FLY-S-9' : 10,
    'RANGE-S-9' : 220,
    
    'MELEE-G-8' : 360,
    'MOUNT-G-8' : 175,
    'FLY-G-8' : 18,
    'RANGE-G-8' : 345,

    'MELEE-G-9' : 185,
    'MOUNT-G-9' : 90,
    'FLY-G-9' : 8,
    'RANGE-G-9' : 175
}

kill_1 = 'MELEE'
kill_2 = 'FLY'
kill_3 = 'MOUNT'
kill_4 = 'RANGE'

factor = 300
for key,value in countLookup.items():
    count = value*factor
    print(key + ":" + str(count))

