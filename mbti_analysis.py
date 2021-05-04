import csv

file = '/Users/adamneal/Downloads/MBTI Personality Types_April 23, 2021_18.43.csv'

houses = ["Elliot", "Kirkland", "Winthrop", "Dunster", "Mather", "Leverett", "Quincy", "Adams", "Lowell", "Pfohozeimer", "Currier", "Cabot"]

with open(file, newline='') as f:
    reader = csv.DictReader(f)
    next(reader)
    next(reader)
    # for row in reader:
    #     print(row['Q2'], row['Q3'])

    house_dict = {"Elliot": [0, 0, 0, 0, 0, 0, 0, 0], "Kirkland": [0, 0, 0, 0, 0, 0, 0, 0], "Winthrop": [0, 0, 0, 0, 0, 0, 0, 0], "Dunster": [0, 0, 0, 0, 0, 0, 0, 0], "Mather": [0, 0, 0, 0, 0, 0, 0, 0], "Leverett": [0, 0, 0, 0, 0, 0, 0, 0], "Quincy": [0, 0, 0, 0, 0, 0, 0, 0], "Adams": [0, 0, 0, 0, 0, 0, 0, 0], "Lowell": [0, 0, 0, 0, 0, 0, 0, 0], "Pforzheimer": [0, 0, 0, 0, 0, 0, 0, 0], "Currier": [0, 0, 0, 0, 0, 0, 0, 0], "Cabot": [0, 0, 0, 0, 0, 0, 0, 0]}
    # E count, I count, S count, N count, T count, F count, J count, P count
    class_dict = {'Class of 2021': [0, 0, 0, 0, 0, 0, 0, 0], 'Class of 2022': [0, 0, 0, 0, 0, 0, 0, 0],
                  'Class of 2023': [0, 0, 0, 0, 0, 0, 0, 0], 'Class of 2024': [0, 0, 0, 0, 0, 0, 0, 0]}
    harvard_list = [0, 0, 0, 0, 0, 0, 0, 0]

    for row in reader:
        if row['Q6'][0] == 'E':
            house_dict[row['Q3']][0] += 1
            class_dict[row['Q2']][0] += 1
            harvard_list[0] += 1
        else:
            house_dict[row['Q3']][1] += 1
            class_dict[row['Q2']][1] += 1
            harvard_list[1] += 1
        if row['Q6'][1] == 'S':
            house_dict[row['Q3']][2] += 1
            class_dict[row['Q2']][2] += 1
            harvard_list[2] += 1
        else:
            house_dict[row['Q3']][3] += 1
            class_dict[row['Q2']][3] += 1
            harvard_list[3] += 1
        if row['Q6'][2] == 'T':
            house_dict[row['Q3']][4] += 1
            class_dict[row['Q2']][4] += 1
            harvard_list[4] += 1
        else:
            house_dict[row['Q3']][5] += 1
            class_dict[row['Q2']][5] += 1
            harvard_list[5] += 1
        if row['Q6'][3] == 'J':
            house_dict[row['Q3']][6] += 1
            class_dict[row['Q2']][6] += 1
            harvard_list[6] += 1
        else:
            house_dict[row['Q3']][7] += 1
            class_dict[row['Q2']][7] += 1
            harvard_list[7] += 1



print(house_dict)
print(class_dict)
print("All of Harvard:", harvard_list)
print(['E', 'I', 'S', 'N', 'T', 'F', 'J', 'P'])
