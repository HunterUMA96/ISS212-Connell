# Hunter Joseph Connell - ISS 212 - Assignment 3:Patch Cycle Determination
# Resources referenced: The walkthrough for Week 4 Assignment 3

year = int(input("Enter the year to check the patch cycle: ")) #Assigning int value from user to variable.
if year < 2019: #anything less than 2019 prints the following.
    print("Not within the managed patch period.")
else: #else, checks if not divisable by 4
    if year % 4 != 0: #if not, prints the following
        print("Standard Year")
    elif year % 100 != 0: #if it is, it checks if divisable by 100 and prints the following
        print("Patch Year")
    elif year % 400 != 0: #if it is, it checks if divisable by 400 and prints the following
        print("Standard Year")
    else: #otherwise its a patch year.
        print("Patch Year")